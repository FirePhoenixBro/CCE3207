# 1
```txt
import os
import xml.etree.ElementTree as ET

# Parse the XML
# xml_data = open(os.path.join(ANNOTATIONS_DIR, "n02085620-Chihuahua/n02085620_7")).read()
# root = ET.fromstring(xml_data)

# Parse the XML
annotationFile = os.path.join(ANNOTATIONS_DIR, "n02085620-Chihuahua/n02085620_7")
annotation = ET.parse(annotationFile)

# Extract data
folder = annotation.find('folder').text
filename = annotation.find('filename').text
database = annotation.find('source/database').text

size = annotation.find('size')
width = int(size.find('width').text)
height = int(size.find('height').text)
depth = int(size.find('depth').text)

segment = int(annotation.find('segment').text)

# Print the extracted information
print(f"Folder: {folder}")
print(f"Filename: {filename}")
print(f"Database: {database}")
print(f"Image size: {width}x{height}x{depth}")
print(f"Segment: {segment}")

# Extract object data
for obj in annotation.findall('object'):
    object_name = obj.find('name').text
    pose = obj.find('pose').text
    truncated = int(obj.find('truncated').text)
    difficult = int(obj.find('difficult').text)

    bndbox = obj.find('bndbox')
    xmin = int(bndbox.find('xmin').text)
    ymin = int(bndbox.find('ymin').text)
    xmax = int(bndbox.find('xmax').text)
    ymax = int(bndbox.find('ymax').text)

    print(f"Object Name: {object_name}")
    print(f"Pose: {pose}")
    print(f"Truncated: {truncated}")
    print(f"Difficult: {difficult}")
    print(f"Bounding Box: ({xmin}, {ymin}, {xmax}, {ymax})")
```