import 'package:warden/story.dart';

class WardenBrain {
  String? _currentScene;
  int _currentStoryIndex = 0;
  Map _storyData = story[0];
  final Map<String, dynamic> _flags = {};

  WardenBrain() {
    _currentScene = _storyData['start'];
  }

  String getScene() {
    if (_currentScene!.contains('ending')) {
      return _storyData['endings'][_currentScene]['text'];
    }
    return _storyData['scenes'][_currentScene]['text'];
  }

  String getChoice(int optionIndex) {
    if (_currentScene!.contains('ending')) {
      List optionList = ['Restart', 'Main Menu'];
      if (optionIndex > optionList.length) return "";
      return optionList[optionIndex - 1];
    }
    List optionList =
        _storyData['scenes'][_currentScene]['choices'].keys.toList();
    if (optionIndex > optionList.length) return "";
    return optionList[optionIndex - 1];
  }

  int getChoiceCount() {
    if (_currentScene!.contains('ending')) return 2;
    return _storyData['scenes'][_currentScene]['choices'].length;
  }

  String? getCurrentScene() {
    return _currentScene;
  }

  int getCurrentStoryIndex() => _currentStoryIndex;

  String getTitle(int index) {
    return story[index]['title'];
  }

  void selectLevel(int index) {
    _currentStoryIndex = index;
    _storyData = story[index];
    _currentScene = _storyData['start'];
  }

  void restart() {
    _currentScene = _storyData['start'];
  }

  void nextScene(int optionIndex) {
    if (_currentScene!.contains('ending')) {
      if (optionIndex == 1) restart();
      return;
    }

    List nextSceneValueList =
        _storyData['scenes'][_currentScene]['choices'].values.toList();
    if (optionIndex > nextSceneValueList.length) return;
    String nextSceneValue = nextSceneValueList[optionIndex - 1];

    if (nextSceneValue.startsWith('jump:')) {
      int targetIndex = int.parse(nextSceneValue.split(':')[1]);
      selectLevel(targetIndex);
    } else {
      _currentScene = nextSceneValue;
    }
  }

  void setFlag(String key, dynamic value) {
    _flags[key] = value;
  }

  dynamic getFlag(String key) {
    return _flags[key];
  }
}
