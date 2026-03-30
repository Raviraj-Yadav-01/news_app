/*
import 'package:flutter/material.dart';
import '../../../data/models/everything_model.dart';
import '../../../data/service/cloudai_service.dart';


class ExplorePage extends StatefulWidget {
  final ArticleModel1? article;
  const ExplorePage({super.key, this.article});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String _summary = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: widget.article == null
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.newspaper, size: 80, color: Colors.grey),
            SizedBox(height: 12),
            Text("Koi article select nahi kiya",
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            SizedBox(height: 8),
            Text("Home se koi article tap karo",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 13)),
          ],
        ),
      )
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Image
            Image.network(
              widget.article!.urlToImage,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 220,
                color: Colors.grey.shade300,
                child: Icon(Icons.image_not_supported, size: 60),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Source Tag
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(widget.article!.source.name,
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  SizedBox(height: 10),

                  // Title
                  Text(widget.article!.title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),

                  // Author & Date
                  Row(
                    children: [
                      Icon(Icons.person_outline, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "${widget.article!.author}  •  ${widget.article!.publishedAt.substring(0, 10)}",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  // Description
                  Text(widget.article!.description,
                      style: TextStyle(fontSize: 14, height: 1.6)),
                  SizedBox(height: 20),

                  // ✨ AI Summarize Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : () async {
                        setState(() => _isLoading = true);
                        final summary = await ClaudeService.summarizeArticle(widget.article!.content);
                        setState(() {
                          _summary = summary;
                          _isLoading = false;
                        });
                      },
                      icon: Icon(Icons.auto_awesome),
                      label: Text(_isLoading ? 'Summarizing...' : 'Summarize with AI ✨'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  // Loading
                  if (_isLoading)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Center(
                          child: CircularProgressIndicator(
                              color: Colors.deepPurple)),
                    ),

                  // ✨ AI Summary Card
                  if (_summary.isNotEmpty && !_isLoading)
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.deepPurple.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.auto_awesome,
                                  color: Colors.deepPurple, size: 18),
                              SizedBox(width: 6),
                              Text('AI Summary',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                      fontSize: 15)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(_summary,
                              style: TextStyle(fontSize: 14, height: 1.6)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../data/models/everything_model.dart';
import '../../../data/service/gemini_service.dart';

class ExplorePage extends StatefulWidget {
  final ArticleModel1? article;
  const ExplorePage({super.key, this.article});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String _summary = '';
  bool _isLoading = false;
  String _mode = 'bullet'; // short | bullet | simple

  Future<void> _generateSummary() async {
    if (widget.article == null) return;

    setState(() => _isLoading = true);

    try {
      final text = "${widget.article!.title}\n${widget.article!.description}\n${widget.article!.content}";

      final result = await GeminiService.summarizeArticle(text, mode: _mode);

      setState(() {
        _summary = result;
      });
    } catch (e) {
      setState(() {
        _summary = 'Failed to generate summary. Please try again.';
      });
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: widget.article == null
          ? const Center(child: Text("No article selected"))
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.article!.urlToImage,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 220,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image_not_supported, size: 60),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.article!.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),

                  Text(widget.article!.description ?? ""),
                  const SizedBox(height: 20),

                  // 🔽 Mode Selector
                  Row(
                    children: [
                      _buildModeButton('short'),
                      _buildModeButton('bullet'),
                      _buildModeButton('simple'),
                    ],
                  ),

                  const SizedBox(height: 15),

                  ElevatedButton(
                    onPressed: _isLoading ? null : _generateSummary,
                    child: Text(_isLoading
                        ? "AI is thinking..."
                        : "Summarize with AI"),
                  ),

                  if (_isLoading)
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                          child: CircularProgressIndicator()),
                    ),

                  if (_summary.isNotEmpty && !_isLoading)
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("AI Summary",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Text(_summary),
                          const SizedBox(height: 10),

                          // 🔽 Copy Button
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: _summary));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                      content:
                                      Text("Copied!")));
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModeButton(String mode) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(mode),
        selected: _mode == mode,
        onSelected: (_) {
          setState(() {
            _mode = mode;
          });
        },
      ),
    );
  }
}
