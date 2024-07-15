import 'package:flowers_store/views/widgets/credit_card_tile.dart';
import 'package:get/get.dart';

List<Map<String, dynamic>> paymentInfo = [
  {
    'holderName': 'Khaled Zaky',
    'endingCardNumber': '1234',
    'expiryDate': '10/26',
    'cardType': CardType.visa,
    'isSelected': false,
  },
  {
    'holderName': 'Sara Ali',
    'endingCardNumber': '5678',
    'expiryDate': '12/25',
    'cardType': CardType.mastercard,
    'isSelected': false,
  },
  {
    'holderName': 'John Doe',
    'endingCardNumber': '9876',
    'expiryDate': '03/28',
    'cardType': CardType.visa,
    'isSelected': false,
  },
  {
    'holderName': 'Emily Smith',
    'endingCardNumber': '5432',
    'expiryDate': '01/25',
    'cardType': CardType.visa,
    'isSelected': false,
  },
  {
    'holderName': 'Michael Johnson',
    'endingCardNumber': '6789',
    'expiryDate': '04/27',
    'cardType': CardType.mastercard,
    'isSelected': false,
  },
  {
    'holderName': 'Jessica Lee',
    'endingCardNumber': '4321',
    'expiryDate': '07/29',
    'cardType': CardType.mastercard,
    'isSelected': false,
  }
];

class PaymentController extends GetxController {
  int selectedCardIndex = 0;

  @override
  void onInit() {
    super.onInit();

    // Check if no isSelected is true
    bool hasSelectedCard = paymentInfo.any((card) => card['isSelected'] == true);
    if (!hasSelectedCard && paymentInfo.isNotEmpty) {
      paymentInfo[0]['isSelected'] = true;
    }
  }

  changeSelectedCard(int index) {
    // Set the selected card index
    selectedCardIndex = index;

    // Update the isSelected value for each payment info
    for (int i = 0; i < paymentInfo.length; i++) {
      if (i == index) {
        paymentInfo[i]['isSelected'] = true;
      } else {
        paymentInfo[i]['isSelected'] = false;
      }
    }

    update();
  }

  deleteCard(int index) {
    // Delete the card from the payment info
    paymentInfo.removeAt(index);
    // Set the isSelected value for the first payment info
    if (paymentInfo.isNotEmpty) {
      paymentInfo[0]['isSelected'] = true;
    }
    update();
  }

  get payments => paymentInfo;
}
