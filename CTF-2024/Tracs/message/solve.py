from PIL import Image


for i in range(1, 17):
    img = Image.open(f'message_part{i}.png')

    # rotate by 180 degrees
    rot_img = img.transpose(Image.ROTATE_90)

    rot_img.save(f'message_part{i}_rotated.png')
