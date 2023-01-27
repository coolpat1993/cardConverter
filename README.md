# playingcards

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

This code defines a Flutter widget called CardConverter, which takes a single argument, a card string. The card string is expected to be in the format of a standard playing card, such as "Ace of Spades" or "10 of Hearts", where the first character is the rank of the card (e.g. "Ace", "10", "2") and the last character is the suit of the card (e.g. "Spades", "Hearts").

The CardConverter widget converts the input card string into an SVG image of a playing card. The code uses a List of Lists called cardArray to determine the layout of the card, based on the rank of the card. The code also uses a Map called \_suits to determine the color and SVG icon for the suit of the card.

The build method of the CardConverter widget is where the majority of the logic for creating the card image is defined. It starts by using the isNumeric function to check if the first character of the card string is a number. If it is, the code sets the number variable to that character. If it is not, the code assumes that the card is a face card (i.e. a "King", "Queen", or "Jack") and sets the number variable accordingly. The code then sets the suit variable to the last character of the card string.

The code then uses the \_suits Map to look up the color and SVG icon for the card's suit. It uses this information to create an SvgPicture object for the suit icon. The code also uses a Map of SvgPicture objects called svgs to create SvgPicture objects for the rank icons (e.g. "King", "Queen", "Jack", "Ace").

The build method then returns a Container widget that uses the Stack widget to lay out the various SVG images of the card. The code uses the cardArray List and the buildIcon function to determine which SVG images should be visible on the card, based on the rank of the card. The Container also uses the BoxDecoration widget to add a border, border radius, and box shadow to the card to give it a more realistic appearance.
