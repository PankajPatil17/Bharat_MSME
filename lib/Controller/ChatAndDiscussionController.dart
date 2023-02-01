import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';

import '../Screens/ChatAndDiscussionForum/GroupChat/GroupChatList.dart';

class ChatAndDiscussionController extends GetxController {
  List GetAllPosts = [].obs;
  List GetPostWithComments = [].obs;
  List GetAllGroupList = [].obs;
  List GetAllGroupMembers = [].obs;
  List GrpMembersFinalArrayOfName = [].obs;
  List GrpMembersFinalArrayOfID = [].obs;
  var CommentsParentsWholedata;
  Future AllPostList({userId}) async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Chat_Controller/post_list'),
      body: {
        // 'user_id': userId.toString(),
      },
    );
    var decodedResponse = json.decode(response.body);
    GetAllPosts = decodedResponse['post_list'];
  }

  Future AllPostwithCommentsList({userId, postID}) async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Chat_Controller/single_post_with_comments'),
      body: {'user_id': userId.toString(), 'post_id': postID.toString()},
    );
    var decodedResponse = json.decode(response.body);
    CommentsParentsWholedata = decodedResponse;
    GetPostWithComments = decodedResponse['post_details']['comments_details'];
  }

  AddNewConversation({userID, descrpition, title, file, context}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${BaseURL}api/Chat_Controller/add_post'));
    request.fields['user_id'] = '${userID}';
    request.fields['description'] = '${descrpition}';
    request.fields['title'] = "${title}";

    request.files
        .add(await http.MultipartFile.fromPath("attachment", "${file}"));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    var decodedResponse = json.decode(responsed.body);

    if (decodedResponse['status'] == 200) {
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

  Future AddConversationWithoutAttachment(
      {userID, descrpition, title, context}) async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Chat_Controller/add_post'),
      body: {
        'user_id': userID.toString(),
        'description': descrpition.toString(),
        'title': title.toString(),
        'attachment': ''
      },
    );
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['status'] == 200) {
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
      {userID, descrpition, title, file, context, parentID}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${BaseURL}api/Chat_Controller/add_post'));
    request.fields['user_id'] = '${userID}';
    request.fields['description'] = '${descrpition}';
    request.fields['title'] = "${title}";
    request.fields['parent_id'] = "${parentID}";

    request.files
        .add(await http.MultipartFile.fromPath("attachment", "${file}"));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    var decodedResponse = json.decode(responsed.body);

    if (decodedResponse['status'] == 200) {
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

  Future AddConversationWithoutAttachmentwithParent(
      {userID, descrpition, title, context, parentID}) async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Chat_Controller/add_post'),
      body: {
        'user_id': userID.toString(),
        'description': descrpition.toString(),
        'title': title.toString(),
        'parent_id': parentID.toString(),
        'attachment': ''
      },
    );
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['status'] == 200) {
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

//##########################Groups api here ########################

  Future GetALLGroup() async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Common_Controller/group_list'),
      body: {},
    );
    var decodedResponse = json.decode(response.body);
    List reverseList = decodedResponse['group_list'];
    GetAllGroupList = reverseList.reversed.toList();
  }

  Future GetGropuMemberList() async {
    http.Response response = await http.get(
      Uri.parse('${BaseURL}api/Chat_Controller/create_group_member_list'),
    );
    var decodedResponse = json.decode(response.body);
    GetAllGroupMembers = decodedResponse['list'];
  }

  CreateGroup({GroupName, UserID, file, context}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${BaseURL}api/Common_Controller/create_group'));
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
  Future LikePost({status, PostID, UserID}) async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Chat_Controller/update_post_like'),
      body: {
        "status": "${status}",
        "post_id": "${PostID}",
        "user_id": "${UserID}"
      },
    );
    print(response.body);
  }
}
