import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:two_mobile/core/network/enums.dart';
import 'package:two_mobile/core/widgets/status-boxs/error_status_box.dart';
import 'package:two_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:two_mobile/features/home/presentation/widgets/home/custom_project_card.dart';
import 'package:two_mobile/features/projects/data/model/project_model.dart';

class ProjectStateHandling {
  final fakeProject = List.filled(
      7,
      ProjectModel(
          id: 0,
          fullName: "fullName",
          companyName: "companyName",
          email: "email",
          phone: "phone",
          projectType: "projectType",
          projectDescription: "projectDescription",
          cost: "cost",
          duration: "duration",
          requirements: "requirements",
          document: "document",
          cooperationType: "cooperationType",
          contactTime: "contactTime",
          private: 0,
          contract: "contract",
          status: "status",
          team: null));

  /// Show All The Project For Recent Project Page
  Widget showAllRecentProjects(HomeState state) {
    if (state.showAllProjectStatus == CasualStatus.loading) {
      return Skeletonizer(
          enabled: true,
          child: ListView.builder(
            itemCount: fakeProject.length,
            itemBuilder: (context, index) =>
                CustomProjectCard(projectModel: fakeProject[index]),
          ));
    } else if (state.showAllProjectStatus == CasualStatus.success) {
      return ListView.builder(
        itemCount: state.allProjectList.length,
        itemBuilder: (context, index) =>
            CustomProjectCard(projectModel: state.allProjectList[index]),
      );
    } else if (state.showAllProjectStatus == CasualStatus.failure) {
      return ErrorStatusBox(errorMessage: state.message);
    } else {
      return const SizedBox();
    }
  }

  /// Show All The Projects In The Page View
  StatefulWidget showAllProjectsListForPageView(HomeState state) {
    if (state.showAllProjectStatus == CasualStatus.success) {
      return PageView.builder(
        itemCount: state.allProjectList.length,
        itemBuilder: (context, index) =>
            CustomProjectCard(projectModel: state.allProjectList[index]),
      );
    } else {
      return Skeletonizer(
        enabled: true,
        child: PageView.builder(
          itemCount: fakeProject.length,
          itemBuilder: (context, index) =>
              CustomProjectCard(projectModel: fakeProject[index]),
        ),
      );
    }
  }

  /// Show My Own Projects
  Widget showMyProjectList(HomeState state) {
    if (state.showMyProjectStatus == CasualStatus.loading) {
      return Skeletonizer(
          enabled: true,
          child: Expanded(
            child: ListView.builder(
              itemCount: fakeProject.length,
              itemBuilder: (context, index) =>
                  CustomProjectCard(projectModel: fakeProject[index]),
            ),
          ));
    } else if (state.showMyProjectStatus == CasualStatus.success) {
      final list = state.myProjectList;
      return Expanded(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => CustomProjectCard(
            projectModel: list[index],
          ),
        ),
      );
    } else if (state.showMyProjectStatus == CasualStatus.failure) {
      return ErrorStatusBox(errorMessage: state.messageShowmyProject);
    } else {
      return const SizedBox();
    }
  }
}
