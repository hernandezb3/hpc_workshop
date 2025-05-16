import pandas as pd
from langchain_ollama import OllamaLLM
from library import start

# ollama model id
model_id = "llama3.2" # llama3.2

# initialize the model
ollama_server_url = "http://localhost:11434"
llm = OllamaLLM(model = model_id, base_url = ollama_server_url)

# create the input for each case in the data frame
# input = prompt + case 
prompt = "I'm going to provide lyrics, tell me who the singer or band is."

data = pd.read_csv(start.DATA)

llama_artist = []
for case in data["lyrics"]:
    prompt_case = prompt + " " + case
    input = [{"role": "user", "content": prompt_case}]
    response = llm.invoke(input)
    print(response)
    llama_artist.append(response)

data["llama_artist"] = llama_artist

# save the output
path = start.OUTPUT_DIR
filename = "song_lyrics_predicted.csv"

data.to_csv(path + filename, index = False)