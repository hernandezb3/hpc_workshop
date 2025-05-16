# building containers on HPC with apptainer

# Step G: build the container
# build an apptainer container from the docker repository
# apptainer = application
# build = create a container
# --force = overwrites any docker images under the same name
# --docker-login = connects the image to your docker account
# --sandbox = builds the container in a directory instead of as a .SIF file
# ollama/ = the custom name of the directory
# docker://ollama/ollama:latest = path to the docker image to use
apptainer build --force --docker-login --sandbox ollama/ docker://ollama/ollama:latest


# Step H: start the container
# apptainer = application
# instance start = start running the container
# ollama/ = name of the container (i.e., the custom name of the directory from the last step)
# ollama_instance = a custom name for the instance
apptainer instance start ollama/ ollama_instance

# Step I: run ollama
# apptainer = application
# shell = enter the container
# instance://ollama_instance = name of the instance to shell into
apptainer shell instance://ollama_instance
# ollama = application
# serve = start ollama
ollama serve

# TERMINAL WINDOW 2 

# Step M: download a model
# apptainer = application
# shell = enter the container
# instance://ollama_instance = name of the instance to shell into
apptainer shell instance://ollama_instance
# list the models that are downloaded in the container
ollama list
# pull the Llama 3.2 model (by default this pulls the 3B param model)
ollama pull llama3.2
# leave the Ollama container shell
exit

# Step N: install python packages
pip3 install -r requirements.txt

# Step O: run python script
python3 classify_with_ollama.py