PYTHON_EXE := "python"
PYTHON_FILE := "C:\Users\aleks\PycharmProjects\LLM Studio\main.py"
WORKING_DIR := ""

^F5::RunPythonScript()

RunPythonScript() {
    global PYTHON_EXE, PYTHON_FILE, WORKING_DIR

    cmd    := '"' . PYTHON_EXE . '" "' . PYTHON_FILE . '"'
    workDir := (WORKING_DIR != "") ? WORKING_DIR : RegExReplace(PYTHON_FILE, "\\[^\\]*$")

    try {
        Run(cmd, workDir, "Hide")

        ToolTip("✓ Python script launched!")
        SetTimer(() => ToolTip(), -250)   ; negative = run once, then stop

    } catch Error as e {
        MsgBox("Failed to run Python script:`n" . e.Message, "Error", "Icon!")
    }
}

A_TrayMenu.Delete()
TrayTip("AHK Python Runner active`nPress Ctrl+F5 to run your script", "Python Runner", 1)