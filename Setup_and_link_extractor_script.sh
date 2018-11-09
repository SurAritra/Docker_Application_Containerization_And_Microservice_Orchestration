echo "Code refference : https://github.com/ibnesayeed/linkextractor "
echo "Setup requires : cloning gihut repository and getting into the folder checkout the version"

git clone https://github.com/ibnesayeed/linkextractor.git
cd linkextractor
git checkout demo

echo "Each step will be performed after git checkout"
git checkout step0
tree

echo "Investigate the python script "
cat linkextractor.py

echo "This is a simple Python script that imports three packages: "
echo "sys from the standard library and two popular third-party packages requests and bs4. "
echo "User-supplied command line argument (which is expected to be a URL to an HTML page) "
echo "is used to fetch the page using the requests package, then parsed using the BeautifulSoup. "
echo "The parsed object is then iterated over to find all the anchor elements (i.e., <a> tags) and "
echo "print the value of their href attribute that contains the hyperlink. "

./linkextractor.py http://example.com/

ls -l linkextractor.py

echo "no sufficient permission"
echo "So 2 ways to address either run as python prog or enable permission"

chmod a+x linkextractor.py
python linkextractor.py

echo "Now the 3rd party library is missing bs4"
echo "Difficulties faced to run a program and how docker come handy"
echo "Is the script executable?"
echo "Is Python installed on the machine?"
echo "Can you install software on the machine?"
echo "Is pip installed?"
echo "Are requests and beautifulsoup4 Python libraries installed?"

echo "==========================================================="
echo "Step 1: Containerized Link Extractor Script"

git checkout step1
tree

echo "Now the pre-requisits are there in the Dockerfile to create images "
cat Dockerfile

echo "Using this Dockerfile we can prepare a Docker image for this script."
echo "We start from the official python Docker image that contains Python’s" 
echo "run-time environment as well as necessary tools to install Python packages" 
echo "and dependencies. We then add some metadata as labels (this step is not essential,"
echo "but is a good practice nonetheless). Next two instructions run the pip install command"
echo "to install the two third-party packages needed for the script to function properly." 
echo "We then create a working directory /app, copy the linkextractor.py file in it, "
echo "and change its permissions to make it an executable script. Finally, we set the script as the entrypoint for the image."

echo "building the image "
docker image build -t linkextractor:step1 .

docker image ls
echo "will show the created image"

echo "Running the container with passing the URL"
docker container run -it --rm linkextractor:step1 http://example.com/

echo "-i ==>interactive ,-t ==>allocate pseudo tty,--rm will auto remove container when done "

echo "====================================================================="
echo "Step 2: Link Extractor Module with Full URI and Anchor Text"




