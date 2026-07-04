import re
import os

def get_emotion(folder_path):
    if folder_path.split('/')[5] == 'TTS_GAITU-DATA':
        for file_name in os.listdir(folder_path):
            emotion = re.sub(r'^([A-Za-z]+).*', r'\1', file_name)
    elif folder_path.split('/')[5] == 'HiTZSpeechSynthesisEmozioak_Dataset':
        for file_name in os.listdir(folder_path):
            emotion = re.sub(r'^([A-Za-z]+)_.*', r'\1', file_name)
    return emotion

def get_tag(tag):
    tag_map = {
            'angry': 'angry',
            'happy': 'happy',
            'disgusted': 'disgusted',
            'sad': 'sad',
            'scared': 'scared',
            'surprised': 'surprised',
            'HAR': 'surprised',
            'HAS': 'angry',
            'POZ': 'happy',
            'TRI': 'sad',
            'NEU': 'neutral'
    }
    return tag_map.get(tag)

emotions = []

