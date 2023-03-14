import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/GroupChat/GroupChatList.dart';

import 'SigupController.dart';

class ChatAndDiscussionController extends GetxController {
  List GetAllPosts = [].obs;
  List GetPostWithComments = [].obs;
  List GetAllGroupList = [].obs;
  List GetAllGroupMembers = [].obs;
  List GrpMembersFinalArrayOfName = [].obs;
  List GrpMembersFinalArrayOfID = [].obs;
  List ChatSearchResult = [].obs;
  var CommentsParentsWholedata;
  var SigunpController = Get.put(signupcontroller());

  Future AllPostList({userId}) async {
    final response = await http.get(Uri.parse('${MSMEURL}api/get-chats'),
        headers: {'Authorization': SigunpController.CurrentToken.toString()});
    var decodedResponse = json.decode(response.body);
    GetAllPosts = decodedResponse['data']['data'];
  }

  Future AllPostwithCommentsList({userId, postID}) async {
    final response = await http.get(
        Uri.parse('${MSMEURL}api/get-replies/${postID}'),
        headers: {'Authorization': SigunpController.CurrentToken.toString()});
    var decodedResponse = json.decode(response.body);
    CommentsParentsWholedata = decodedResponse;
    GetPostWithComments = decodedResponse['data']['data'];
  }

  AddNewConversation({descrpition, title, file, context}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${MSMEURL}api/save-chat'));
    request.headers.addAll(
        {"Authorization": "${SigunpController.CurrentToken.toString()}"});
    request.fields['description'] = '${descrpition}';
    request.fields['title'] = "${title}";
    request.fields['is_visible_to'] = "0";
    request.files
        .add(await http.MultipartFile.fromPath("attachment[]", "${file}"));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    var decodedResponse = json.decode(responsed.body);

    if (decodedResponse['status'] == true) {
      print(response.statusCode);
      print('resbeco${responsed.body}');
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Conversation successfully posted"),
      ));
    } else {
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields are required."),
      ));
    }
  }

  Future AddConversationWithoutAttachment({descrpition, title, context}) async {
    final response =
        await http.post(Uri.parse('${MSMEURL}api/save-chat'), body: {
      'description': descrpition.toString(),
      'title': title.toString(),
      'is_visible_to': '0'
    }, headers: {
      'Authorization': SigunpController.CurrentToken.toString()
    });
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['status'] == true) {
      print(response.statusCode);
      print('resbeco${response.body}');
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Conversation successfully posted"),
      ));
    } else {
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields are required."),
      ));
    }
  }

  AddNewConversationwithParent(
      {descrpition, title, file, context, parentID, Description}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${MSMEURL}api/save-chat'));
    request.headers.addAll(
        {"Authorization": "${SigunpController.CurrentToken.toString()}"});
    request.fields['description'] = '${descrpition}';
    request.fields['title'] = "${title}";
    request.fields['post_id'] = "${parentID}";

    request.files
        .add(await http.MultipartFile.fromPath("attachment[]", "${file}"));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    var decodedResponse = json.decode(responsed.body);

    if (decodedResponse['status'] == true) {
      print(response.statusCode);
      print('resbeco${responsed.body}');
      Description.clear();
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Conversation successfully posted"),
      ));
    } else {
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields are required."),
      ));
    }
  }

  Future AddConversationWithoutAttachmentwithParent(
      {title, context, parentID, Description, descrpition}) async {
    final response =
        await http.post(Uri.parse('${MSMEURL}api/save-chat'), body: {
      'description': descrpition.toString(),
      'title': title.toString(),
      'post_id': parentID.toString(),
    }, headers: {
      'Authorization': SigunpController.CurrentToken.toString()
    });
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['status'] == true) {
      print(response.statusCode);
      print('resbeco${response.body}');
      Description.clear();
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Conversation successfully posted"),
      ));
    } else {
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields are required."),
      ));
    }
  }

//##########################Groups api here ########################

  Future GetALLGroup() async {
    final response = await http.post(
      Uri.parse('${MSMEURL}api/Common_Controller/group_list'),
      body: {},
    );
    var decodedResponse = json.decode(response.body);
    List reverseList = decodedResponse['group_list'];
    GetAllGroupList = reverseList.reversed.toList();
  }

  Future GetGropuMemberList() async {
    http.Response response = await http.get(
      Uri.parse('${MSMEURL}api/Chat_Controller/create_group_member_list'),
    );
    var decodedResponse = json.decode(response.body);
    GetAllGroupMembers = decodedResponse['list'];
  }

  CreateGroup({GroupName, UserID, file, context}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${MSMEURL}api/Common_Controller/create_group'));
    request.fields['group_name'] = '${GroupName}';
    request.fields['user_id'] = '${UserID}';
    request.fields['group_members'] = GrpMembersFinalArrayOfID.toString();
    request.fields['group_type'] = "3";

    request.files
        .add(await http.MultipartFile.fromPath("group_img", "${file}"));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    var decodedResponse = json.decode(responsed.body);

    if (decodedResponse['status'] == 200) {
      print(response.statusCode);
      print('resbeco${responsed.body}');
      Get.to(GroupChatList());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Group Created Successfully"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields are required."),
      ));
    }
  }

  //################################ Like API ###############################
  Future LikePost({status, PostID}) async {
    final response =
        await http.post(Uri.parse('${MSMEURL}api/save-like'), body: {
      "status": "${status}",
      "id": "${PostID}",
    }, headers: {
      'Authorization': SigunpController.CurrentToken.toString()
    });
    print(response.body);
  }
}
