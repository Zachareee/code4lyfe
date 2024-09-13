cd %~dp0
for %%i in (handlers\*.py) do (if not exist "..\..\output\%%~ni" (mkdir ..\..\output\%%~ni)) && python -m pip install -r requirements.txt --target ..\..\output\%%~ni && copy /Y %%i ..\..\output\%%~ni\index.py
