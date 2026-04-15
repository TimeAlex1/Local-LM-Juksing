import lmstudio as lms
import pyperclip
import pyautogui

pasted_text = pyperclip.paste()

model = lms.llm("google/gemma-3-4b")
result = str(model.respond(pasted_text + " (Do not include polite filler phrases like 'Here is the answer' or 'I hope this helps', additionally do not add a reply to this parameter like 'Sure, here is...')")).replace("*", "")
pyautogui.press('_')

pyperclip.copy(result)


