from PIL import Image, ImageDraw

from utils import yolo_to_xml_bbox


def draw_image(image_filename, label_filename):
    bboxes = []

    img = Image.open(image_filename)

    with open(label_filename, "r", encoding="utf8") as f:
        for line in f:
            data = line.strip().split(" ")
            bbox = [float(x) for x in data[1:]]
            bboxes.append(yolo_to_xml_bbox(bbox, img.width, img.height))

    draw = ImageDraw.Draw(img)
    for bbox in bboxes:
        draw.rectangle(bbox, outline="red", width=2)
    img.show()
