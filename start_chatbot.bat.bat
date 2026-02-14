@echo off
title AI Chatbot Launcher

echo =====================================
echo Starting AI Chatbot System...
echo =====================================

:: Step 1 - Start Ollama server
echo Starting Ollama server...
start "Ollama Server" cmd /k "ollama serve"

:: Wait for Ollama to initialize
timeout /t 5 >nul

:: Step 2 - Ensure model exists
echo Checking opencoder:1.5b model...
ollama pull opencoder:1.5b

:: Step 3 - Navigate to chatbot folder
cd /d C:\Users\Dell\Desktop\chatbot

:: Step 4 - Start Flask backend
echo Starting Python backend...
start "Flask Backend" cmd /k "python app.py"

:: Wait for backend to initialize
timeout /t 5 >nul

:: Step 5 - Open project folder
echo Opening chatbot folder...
start "" "C:\Users\Dell\Desktop\chatbot"

:: Step 6 - Open index.html directly
echo Opening index.html...
start "" "C:\Users\Dell\Desktop\chatbot\index.html"

echo =====================================
echo Chatbot should now be running!
echo =====================================

exit
