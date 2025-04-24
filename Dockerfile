# use the official Python image as base image
FROM python:3.9-slim

# set working directory inside the container to /app
WORKDIR /app

# copy all files from the current directory (on host) into the container's /app directory
COPY . .

# upgrade pip to the latest version
RUN pip install --upgrade pip

# install all Python dependencies listed in requirements.txt
RUN pip install -r requirements.txt

# expose Streamlit default port
EXPOSE 8501

# set the default command to run the Streamlit app when the container starts
CMD ["streamlit", "run", "prediction_app.py", "--server.port=8501", "--server.address=0.0.0.0"]
