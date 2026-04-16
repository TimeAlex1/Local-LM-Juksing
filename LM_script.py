import lmstudio as lms
import pyperclip
import pyautogui
import time

pasted_text = pyperclip.paste()

def run_model():
    try:
        model = lms.llm("google/gemma-3-4b")
        result = str(model.respond(pasted_text + " (Do not include polite filler phrases like 'Here is the answer' or ""'I hope this helps', additionally do not add a reply to this parameter like 'Sure, here is...')")).replace("*", "")
        pyautogui.press('_')
        pyperclip.copy(result)


    except Exception as e:
        print(f"Unexpected error: {e}, retrying in 5s...")
        time.sleep(5)

run_model()