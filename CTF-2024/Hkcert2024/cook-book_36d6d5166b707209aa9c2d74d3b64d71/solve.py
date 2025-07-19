from turtle import width
from PIL import Image
import numpy as np


def try_display_image(data, width):
    """
    Essaie d'afficher les données avec une largeur spécifique
    """
    # Calculer la hauteur
    height = len(data) // width
    if height == 0:
        return None

    # Redimensionner les données
    data = data[: width * height]  # Tronquer aux dimensions exactes

    try:
        # Convertir en tableau 2D
        image_data = np.frombuffer(data, dtype=np.uint8)
        image_array = image_data.reshape((height, width))

        # Créer et retourner l'image
        return Image.fromarray(image_array)
    except:
        return None


if __name__ == "__main__":

    with open("flag.enc", "rb") as f:
        data = f.read()



    data = data[64:]
    for i, width in enumerate([128, 192, 256, 384, 512, 768, 1024, 1536]):
        height = len(data) // width
        image_data = np.frombuffer(data, dtype=np.uint8)
        image_array = image_data.reshape((height, width))
        img = Image.fromarray(image_array)
        img.save(f"flag_{i}.png")
    print("Analyse terminée !")
