import sys
import png
import random

reader=png.Reader(filename=sys.argv[1])
width, height, pixels, meta = reader.read_flat()

pixel_size = 3
if meta['alpha'] == True:
    pixel_size = 4

nb_pixels = len(pixels)//pixel_size

pointeur_pixels=0
while pointeur_pixels != nb_pixels:
    # Mode économique : il suffit d'effacer une couleur au hasard du pixel pour détruire l'information
    couleur=random.randint(0, 2)
    valeur=random.randint(0, 1)
    pixel = pixels[pointeur_pixels*pixel_size:(pointeur_pixels+1)*pixel_size]
    pixel[couleur]=valeur
    pixels[pointeur_pixels*pixel_size:(pointeur_pixels+1)*pixel_size] = pixel
    pointeur_pixels+=1

fileout = open(sys.argv[1], 'wb')
writer = png.Writer(width, height, greyscale=False)
writer.write_array(fileout, pixels)
fileout.close()

