import "package:quotes/features/random_quote/domain/entities/quote.dart";

class QuoteModel extends Quote {
  const QuoteModel({
    required super.author,
    required super.id,
    required super.content,
    required super.permalink,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> jsonData) => QuoteModel(
        author: jsonData["author"],
        id: jsonData["id"],
        content: jsonData["quote"],
        permalink: jsonData["permalink"],
      );
  Map<String, dynamic> toJson() => {
        "author": author,
        "id": id,
        "content": content,
        "permalink": permalink,
      };
}
