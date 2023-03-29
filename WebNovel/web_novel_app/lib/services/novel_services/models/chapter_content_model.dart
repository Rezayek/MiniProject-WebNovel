class ChapterContentModel {
  final int textId;
  final String content;
  final int totalComments;

  const ChapterContentModel(
      {required this.textId,
      required this.content,
      required this.totalComments});

  factory ChapterContentModel.fromSnapshot(Map<String, dynamic> snapshot) =>
      ChapterContentModel(
          textId: snapshot["textId"],
          content: snapshot["content"],
          totalComments: snapshot["totalComments"]);
}
