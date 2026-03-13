@echo off
REM Cursor Skill Transparency Rule - Windows Installation Script
REM Supports: Windows 10/11 with PowerShell

setlocal enabledelayedexpansion

echo === Cursor Skill Transparency Rule Installer ===
echo Platform: Windows
echo.

REM Get script directory
set "SCRIPT_DIR=%~dp0"
set "RULE_FILE=skill-transparency.mdc"

REM Detect editor
if exist "%USERPROFILE%\.cursor" (
    set "EDITOR_NAME=Cursor"
    set "RULES_DIR=%USERPROFILE%\.cursor\rules"
) else if exist "%USERPROFILE%\.claude" (
    set "EDITOR_NAME=Claude Code"
    set "RULES_DIR=%USERPROFILE%\.claude\rules"
) else (
    set "EDITOR_NAME=Cursor"
    set "RULES_DIR=%USERPROFILE%\.cursor\rules"
)

echo Detected editor: %EDITOR_NAME%
echo Installation directory: %RULES_DIR%
echo.

REM Create rules directory if it doesn't exist
if not exist "%RULES_DIR%" (
    echo Creating rules directory...
    mkdir "%RULES_DIR%"
    echo Directory created: %RULES_DIR%
) else (
    echo Rules directory found: %RULES_DIR%
)
echo.

REM Check if rule already exists
if exist "%RULES_DIR%\%RULE_FILE%" (
    echo WARNING: Rule file already exists!
    set /p "REPLACE=Do you want to backup and replace it? (y/n): "
    if /i "!REPLACE!"=="y" (
        set "BACKUP_NAME=skill-transparency.mdc.backup.%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%"
        set "BACKUP_NAME=!BACKUP_NAME: =0!"
        move "%RULES_DIR%\%RULE_FILE%" "%RULES_DIR%\!BACKUP_NAME!" >nul
        echo Backed up to: !BACKUP_NAME!
    ) else (
        echo Installation cancelled.
        exit /b 0
    )
)

REM Copy rule file
echo.
echo Installing rule file...
if exist "%SCRIPT_DIR%%RULE_FILE%" (
    copy "%SCRIPT_DIR%%RULE_FILE%" "%RULES_DIR%\" >nul
    echo Rule installed: %RULES_DIR%\%RULE_FILE%
) else (
    echo ERROR: %RULE_FILE% not found in script directory
    exit /b 1
)

REM Verify installation
echo.
echo Verifying installation...
if exist "%RULES_DIR%\%RULE_FILE%" (
    for %%A in ("%RULES_DIR%\%RULE_FILE%") do set "FILE_SIZE=%%~zA"
    echo Installation verified (file size: !FILE_SIZE! bytes)
) else (
    echo Verification failed
    exit /b 1
)

REM Display next steps
echo.
echo === Installation Complete! ===
echo.
echo Next steps:
echo 1. Restart %EDITOR_NAME%
echo 2. Start a new chat session
echo 3. Try asking: "帮我添加一个新功能"
echo 4. You should see: "🔧 正在使用 [skill-name] 技能"
echo.
echo For more information:
echo - Documentation: %SCRIPT_DIR%docs\
echo - README: %SCRIPT_DIR%README.md
echo.
echo Happy coding with transparent skills!
echo.
pause
