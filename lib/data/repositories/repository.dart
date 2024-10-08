// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jurney_blog_app/data/repositories/auth_repo.dart';
import 'package:jurney_blog_app/data/repositories/category_repo.dart';
import 'package:jurney_blog_app/data/repositories/home_repo.dart';
import 'package:jurney_blog_app/data/repositories/profile_repo.dart';
import 'package:jurney_blog_app/data/repositories/tags_repo.dart';

class Repository {
  final TagsRepo tagsRepo;
  final CategoryRepo categoryRepo;
  final AuthRepo authRepo;
  final HomeRepo homeRepo;
  final ProfileRepo profileRepo;

  Repository({
    required this.tagsRepo,
    required this.categoryRepo,
    required this.authRepo,
    required this.homeRepo,
    required this.profileRepo,
  });
}
