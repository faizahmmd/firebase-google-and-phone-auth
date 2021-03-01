import 'package:flutter/material.dart';

class Constants {
  static final rupeeSymbol = "\u20B9";
  static const String FEATURE_NOT_AVAILABLE = "Feature not available";
  static const String BOX_NAME = "box";

  ///gradients
  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.white,
    Color(0xFF272726),
    Color(0xFF707070),
    Colors.blue,
    Colors.green,
    Colors.grey, //5
    Color.fromRGBO(60, 80, 20, 0),
    Colors.transparent,
    Colors.red
  ];

  ///card size
  static const double CARD_HEIGHT = 190;
  static const double CARD_WIDTH = 160;

  ///icons
  static const String QR_CODE_ICON = "assets/icons/qr_code.png";
  static const String LOGIN_LOGO_ICON = "assets/icons/login_logo.png";
  static const String ORDER_HISTORY_ICON = "assets/icons/time.png";
  static const String HOME_ICON = 'assets/icons/home.png';
  static const String SETTINGS_ICON = 'assets/icons/setting.png';
  static const String BOOKING_RUPEES_ICON = 'assets/icons/rupee.png';
  static const String DELETE_ICON = 'assets/icons/delete.png';
  static const String SODEXO_PNG = 'assets/images/sodexo.png';
  static const String PAYTM_PNG = 'assets/images/paytm.png';

  ///error
  static const String SOME_ERROR_OCCURRED = "Some error occurred.";

  ///login
  static const String LOGIN_LABEL_TEXT = "Outlook ID";
  static const String LOGIN_PASSWORD_LABEL_TEXT = "Password";
  static const String LOGIN_HELPER_TEXT = "Please enter your Outlook ID";
  static const String LOGIN_PASSWORD_HELPER_TEXT = "Minimum 6 characters.";
  static const String LOGIN_CONFIRMATION_TEXT = "Do you really want to logout?";
  static const String LOGOUT_TEXT = "Logout";
  static const String LOGOUT_TITLE = "Enter Login Details";

  /// image url
  static const String APP_LOGO = 'assets/icon/login_logo.png';

  ///background images
  static const String BACKGROUND_DASHBOARD =
      "assets/images/background/background_1.png";
  static const String BACKGROUND_SETTINGS =
      "assets/images/background/background_7.png";
  static const String BACKGROUND_BOOKING_HISTORY =
      "assets/images/background/background_6.png";
  static const String BACKGROUND_LOGIN =
      "assets/images/background/background_9.png";
  static const String BACKGROUND_BOOKING =
      "assets/images/background/background_3.png";
  static const String BACKGROUND_BOOKING_DETAILS =
      "assets/images/background/background_8.png";
  static const String BACKGROUND_CONFIRMATION =
      "assets/images/background/background_5.png";

  ///pages

  ///canteen selection
  static const String CANTEEN_SELECTION = "Select Canteen";
  static const String CANTEEN_OPEN_TIME = "Open : 10am - 5pm";

  ///Dashboard
  static const String WARNING_TOAST_LUNCH =
      "Lunch should be booked before 10 AM";
  static const String WARNING_TOAST_DINNER =
      "Dinner should be booked before 6 PM";

  ///Booking screen
  static const String BOOKING_TITLE = "Book Your ";
  static const String CONFIRM_DINE_IN = "Confirm dine-in order?";
  static const String SEARCH_HINT_TEXT = "Search Outlook id or Name";
  static const String TOAST_NOTHING_TO_SEARCH = "Nothing to search";
  static const String TOTAL_AMOUNT = "Total amount is ";
  static const String BOTTOM_SHEET_BUTTON_TEXT_DINE_IN = "Agree to Dine-In";
  static const String BOTTOM_SHEET_BUTTON_TEXT_OTHER_PAYMENT =
      "Proceed to pay \u20B9";
  static const String BOTTOM_SHEET_PAY_AT_DINE = "Pay at Dine";
  static const String BOTTOM_SHEET_OTHER_PAYMENT = "Pay with";
  static const String BOOKING_BUTTON_TEXT = "Proceed to book";
  static const String MAXIMUM_MEMBERS_ADDED = "Maximum members added";
  static const String TERMS_CONDITION =
      "I hereby take the responsibility of arranging the payment/"
      "deduction of same from my salary, if self/ "
      "my team members whose meal booking I have done here, will not avail the meal facility";
  static const String SAMPLE_SEARCH_TEXT = "aac";

  ///order page
  static const String ORDERS_TITLE = "My Orders";
  static const String BOOKING_STATUS_CANCELLED = "CANCELLED";
  static const String BOOKING_STATUS_COMPLETED = "COMPLETED";
  static const String BOOKING_STATUS_CONFIRMED = "CONFIRMED";
  static const String TAB_HISTORY = "History";
  static const String TAB_PENDING = "Pending";

  ///pending order
  static const String ORDER_CANCEL_SUCCESSFULLY = "Successfully Cancelled!";
  static const String REFUND_INITIALIZATION_STARTED = "Refund initialized";
  static const String ORDER_CANNOT_CANCEL = "Order cannot be cancelled";

  ///order details view
  static const String ORDER_DETAILS_TITLE = "Order Details";
  static const String FEEDBACK_TOAST = "Please share your experience with us";
  static const String FEEDBACK_RATING_COMPLETION =
      "Please complete your ratings";
  static const String FEEDBACK_EXPERIENCE =
      "How was your experience with this booking?";
  static const String FEEDBACK_POST = "Post";

  ///add Photo
  static const String ADD_ATLEAST_ONE_PHOTO = "Please add atleast one photo:";
  static const String ADD_PHOTO = "Add Photo";
  static const String MAXIMUM_PHOTO = "Maximum 5 images";

  ///post feedback dialog
  static const String FEEDBACK_CONFIRMATION = "Confirm posting feedback?";
  static const String FEEDBACK_POST_SUCCESS = "Feedback posted successfully.";
  static const String FEEDBACK_TEXT_BOX_LABEL =
      "Describe your experience with us";

  ///Admin page order completion toasts
  static const String VALID_QR = "Booking ID is valid!";
  static const String ALREADY_CONFIRMED = "This booking is already completed!";
  static const String CANCELLED_BOOKING = "This is a cancelled booking!";
  static const String INVALID_QR = "Invalid QR code!";

  ///Admin page headings
  static const String LUNCH_HEADING = "Lunch Count";
  static const String DINNER_HEADING = "Dinner Count";
  static const String DIALOG_TEXT_CANNOT_SCAN =
      "Sorry, you can only scan the QR codes for lunch from 10:00 AM to 2:15PM and for Dinner from 6:00 PM to 11:59 PM.";

  ///force  update
  static const String NEW_VERSION_AVAILABLE = "New Version available!";
  static const String UPDATE_DETAILS =
      "We've been working on some amazing new features just for you.Please update now!";

  ///dialog
  static const String CANCEL = "Cancel";
  static const String OK = "Ok";
  static const String YES = "Yes";
  static const String CLOSE = "Close";
  static const String UPDATE = "Update";
  static const String ORDER_CANCELLATION = "Confirm order cancellation?";

  static const String NO_DATA_TEXT = "Nothing to show here";
  static const String POWERED_BY = "powered by ";

  ///settings
  static const String SETTINGS_TITLE = "Settings";
  static const String PRIVACY_POLICY = "Privacy policy";
  static const String SETTING_TERMS_CONDITION = "Terms & conditions";

  ///terms&conditions
  static const String TERMS_CONDITIONS_TITLE = 'Terms & Conditions';
  static const String TERMS_CONDITIONS_SUBTITLE =
      'Please read these Terms & Conditions carefully before using the service\n';
  static const String TERMS_CONDITIONS_1 =
      '1. Meal booking timings : Before 10 AM for lunch and before 6 PM for dinner\n';
  static const String TERMS_CONDITIONS_2 =
      '2. Outlook login credentials are required to login\n';
  static const String TERMS_CONDITIONS_3 =
      '3. Cancellation of meal booked can be done only within 15 mins of booking\n';
  static const String TERMS_CONDITIONS_4 =
      '4. Cyclic (Monday to Sunday) meal choices are available on the app\n';
  static const String TERMS_CONDITIONS_5 =
      '5. Control room deliveries have to be booked on  the app and has to be informed to the respective canteens\n';
  static const String TERMS_CONDITIONS_6 =
      '6. More than 5 meals cannot be booked on the app. Name & SAP ID is compulsory\n';
  static const String TERMS_CONDITIONS_7 =
      '7. Booking ID to be shown to  the cafeteria cashier\n';

  ///no internet
  static const String NO_INTERNET_TEXT = "No Internet Connection !!!";
  static const String INTERNET_CONNECTED = "Internet Connected !!!";

  ///Qr generator
  static const String QR_GENERATOR_TEXT =
      'Your booking ID QR, Show this at canteen \nto get your meal.';

  ///validators
  static const String EMAIL_NOT_VALID = "Email is not valid";
  static const String USERNAME_NOT_VALID = "Username is not valid";
  static const String PASSWORD_LENGTH =
      "Password length should be greater than 5 chars.";
  static const String INVALID_MOBILE_NUM = "Invalid mobile number";
  static const String INVALID_NAME = "Invalid name";

  ///payment

  static const String REQUEST_ID = "req_spar_vbdjkahf";
  static const String BOOKING_WAITING = "Please wait... your meal is booking..";
  static const String BOOKING_TRANSACTION_IN_PROGRESS =
      "Transaction in progress. Press back button to cancel booking.";

  static const String SOURCE_ID = "";
  static const String SODEXO = "sodexo";
  static const String CASH = "cash";
  static const String PAYTM = "paytm";
  static const String A_ID = "202034";
  static const String M_ID = "092010001058307";
  static const String T_ID = "92128057";
  static const String FAIL_URL = "Password";
  static const String SUCCESS_URL = "Password";
  static const String CARD_HOLDER_NAME = "Card holder's name : ";
  static const String CARD_NUMBER = "Card number : ";
  static const String CARD_BALANCE = "Card balance : ";
  static const String CARD_DETAILS = "Card details";
  static const String AMOUNT_TO_BE_PAID = "Amount to be paid : ";
  static const String PAY_WITH_SODEXO = "Pay with sodexo";
  static const String CONFIRM_DELETE = "Confirm delete ?";
  static const String CARD_DELETED = "Card deleted successfully";
  static const String SAMPLE_API_KEY =
      "w9e75yifheq09tyehqriofhy0q349htorehtlGJKHu095338kehqo";
  static const String PAYMENT_METHOD_NOT_AVAILABLE =
      "Oops, looks like no payment methods are available!\n Contact Admin";

  static const String TERMS_CONDITIONS_LONG =
      '''<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<body lang="en-US" link="#000080" vlink="#800000" dir="ltr">
<p style="margin-bottom: 0.28cm; line-height: 108%"><b><h3>Introduction:</h3>
</b>
</p>
<p align="right"; style="margin-bottom: 0.28cm; line-height: 108%"><a name="_GoBack"></a>
These terms and conditions apply to the User who uses the Online
Services provided for any payment made to Shreya Hospitality Services
Pvt Ltd. Kindly read these terms and conditions carefully. By
authorizing a payment to SHREYA HOSPITALITY SERVICES PVT LTD through
the online payment service (&quot;the service&quot;), it would be
treated as a deemed acceptance to these terms and conditions. SHREYA
HOSPITALITY SERVICES PVT LTD reserves all the rights to amend these
terms and conditions at any time without giving prior notice. It is
the responsibility of the User to have read the terms and conditions
before using the Service. Complete Canteen App Own by AMNS India and
AMNS India reserves all rights to change the merchant at any point of
time.  
</p>
</br>
<p style="margin-bottom: 0.28cm; line-height: 108%"><b>Key terms: </b>
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">The following is
a summary of the key terms of this service: 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; Payment(s)
through this Service may only be made with a Sodexo, Credit Card,
Debit card or Net Banking, PayTM and other Online Wallets. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; Before
using this Service, it is recommended that the user shall make
necessary enquiry about the charges or payment payable against the
Credit/Debit card used from Credit Card or the Debit Card service
provider i.e. the respective Bank. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; The credit
card information supplied at the time of using the service is
processed by the payment gateway of the service provider and is not
supplied to SHREYA HOSPITALITY SERVICES PVT LTD. It is the sole
responsibility of the User of the service to ensure that the
information entered in the relevant fields are correct. It is
recommended that you take and retain a copy of the transaction for
record keeping purposes, which might assist in resolution of any
disputes that may arise out or usage of the service. Shreya
Hospitality Services Pvt Ltd App does not store credit card and
related information in the Database. But will store the transaction
id, user information and the transaction amount. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; The
Applicant agrees, understands and confirms that his/ her personal
data including without limitation details relating to debit card/
credit card/net banking transmitted over the Internet may be
susceptible to misuse, hacking, theft and/ or fraud and that SHREYA
HOSPITALITY SERVICES PVT LTD or the Payment Service Provider(s) have
no control over such matters. In case of such Fraudulent Misuse of
payment information by any hacker or malicious third party agents,
SHREYA HOSPITALITY SERVICES PVT LTD App or its owners are not
responsible or liable for any monetary or non-monetary losses. The
applicant agrees that they cannot claim any amount for such incidents
to SHREYA HOSPITALITY SERVICES PVT LTD App and its owners.</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; The
service is provided using a payment gateway service provider through
a mobile app. However, neither the payment gateway service provider
nor the SHREYA HOSPITALITY SERVICES PVT LTD gives any assurance, that
the information so provided online by a user is secured or may be
read or intercepted by a third party. SHREYA HOSPITALITY SERVICES PVT
LTD does not accept or assume any liability in the event of such
unauthorized interception, hacking or other unauthorized access to
information provided by a user of the service. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; SHREYA
HOSPITALITY SERVICES PVT LTD and/or the Payment Service Providers
shall not be liable for any inaccuracy, error or delay in, or
omission of (a) any data, information or message, or (b) the
transmission or delivery of any such data, information or message; or
(c) any loss or damage arising from or occasioned by any such
inaccuracy, error, delay or omission, non-performance or interruption
in any such data, information or message. Under no circumstances
shall the SHREYA HOSPITALITY SERVICES PVT LTD and/or the Payment
Service Providers, its employees, directors, and its third party
agents involved in processing, delivering or managing the Services,
be liable for any direct, indirect, incidental, special or
consequential damages, or any damages whatsoever, including punitive
or exemplary arising out of or in any way connected with the
provision of or any inadequacy or deficiency in the provision of the
Services or resulting from unauthorized access or alteration of
transmissions of data or arising from suspension or termination of
the Service. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; The
Applicant agrees that SHREYA HOSPITALITY SERVICES PVT LTD or any of
its employees will not be held liable By the Applicant for any loss
or damages arising from your use of, or reliance upon the information
contained on the Mobile app, or any failure to comply with these
Terms and Conditions where such failure is due to circumstance beyond
SHREYA HOSPITALITY SERVICES PVT LTD&rsquo;s reasonable control. 
</p>
</br>
<p style="margin-bottom: 0.28cm; line-height: 108%"><b>Debit/Credit
Card, Bank Account Details: </b>
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; The
Applicant agrees that the debit/credit card details provided by him/
her for use of the aforesaid Service(s) must be correct and accurate
and that the Applicant shall not use a Debit/ credit card, that is
not lawfully owned by him/ her or the use of which is not authorized
by the lawful owner thereof. The Applicant further agrees and
undertakes to Provide correct and valid debit/credit card details. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; The
Applicant may pay his/ her application/initial payment to SHREYA
HOSPITALITY SERVICES PVT LTD by using a debit/credit card or through
online banking account. The Applicant warrants, agrees and confirms
that when he/ she initiates a payment transaction and/or issues an
online payment instruction and provides his/ her card / bank details:
</p>
<ul>
	<li><p style="margin-bottom: 0.28cm; line-height: 108%">The
	Applicant is fully and lawfully entitled to use such credit / debit
	card, bank account for such transactions; 
	</p>
	<li><p style="margin-bottom: 0.28cm; line-height: 108%">The
	Applicant is responsible to ensure that the card/ bank account
	details provided by him/ her are accurate; 
	</p>
	<li><p style="margin-bottom: 0.28cm; line-height: 108%">The
	Applicant authorizes debit of the nominated card/ bank account for
	the Payment of payment selected by such Applicant along with the
	applicable Payment. 
	</p>
	<li><p style="margin-bottom: 0.28cm; line-height: 108%">The
	Applicant is responsible to ensure that sufficient credit is
	available on the nominated card/ bank account at the time of making
	the payment to permit the Payment of the dues payable or payment
	dues selected by the Applicant inclusive of the applicable Meal .</p>
</ul>
</br>
<p style="margin-bottom: 0.28cm; line-height: 108%"><b>No warranty: </b>
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">No warranty,
representation or guarantee, express or implied, is given by the
SHREYA HOSPITALITY SERVICES PVT LTD in respect of the operation of
the service. 
</p>
</br>
<p style="margin-bottom: 0.28cm; line-height: 108%"><b>Disclaimer and
Limitation of liability: </b>
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">SHREYA
HOSPITALITY SERVICES PVT LTD does not accept liability for any
damage, loss, cost (including legal costs), expenses, indirect losses
or consequential damage of any kind which may be suffered or incurred
by the User from the use of this service. 
</p>
</br>
<p style="margin-bottom: 0.28cm; line-height: 108%"><b>Governing law:
</b>
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">These terms and
conditions are governed by the laws of India and the competent courts
at Ahmedabad shall have exclusive jurisdiction. 
</p>
</br>
<p style="margin-bottom: 0.28cm; line-height: 108%"><b>Dispute
Resolution: </b>
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">Any dispute
arising in relation to the terms and conditions will be submitted to
a sole arbitrator appointed by SHREYA HOSPITALITY SERVICES PVT LTD. 
</p>
</br>
<p style="margin-bottom: 0.28cm; line-height: 108%"><b>Refund/Cancellation
Policy: </b>
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">Payment once paid
will not be refunded under any circumstances. 
</p>
</br>
<p style="margin-bottom: 0.28cm; line-height: 108%"><b>Privacy
Policy:</b></p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; The
information provided by the user on this mobile app shall be kept
confidential and shall not be shared with anyone except merchant or
service provider. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; SHREYA
HOSPITALITY SERVICES PVT LTD may share your personal information with
our bankers for clearing necessary payment payments. This information
shall be strictly up to the legal permissible limit and not
exceeding. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; Online
Meal Payment system purpose to provide flexibility and conform to its
continuing Student by offering option to pay online using various
payment methods. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; It is sole
responsibility of student to pick online payment option. SHREYA
HOSPITALITY SERVICES PVT LTD do not recommend/ prefer/promote any
particular method. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; If payment
is made by means of a card that you do not personally own, the
permission of the card owner must always be obtained to make payments
using the card. In using the system you confirm that you have such
permission. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull;
Information related to payments using debit or credit card is not
accessed or stored by the Institute. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; No
Warranty: The information and materials contained in this site
including, graphics, links or other items are provided as on &ldquo;As
Is&rdquo; and &ldquo;As Available&rdquo; basis by the Institute which
organized and tries to provide information accurately and expressly
disclaims liability for error or omission in this information and
materials. No warranty of any kind, implied, express or statutory
shall be given by the Institute shall not be limited to the warranty
of fitness for a particular purpose and freedom from computer virus
is given in conjunction with the information and materials. 
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">&bull; Limitation
of Liability: In no event, Institute will be liable for any damage
direct or indirect losses or expenses arising in connection with site
or use thereof inability to use by any person delay of operation or
transaction, computer virus etc. 
</p>
</br>
<p style="margin-bottom: 0.28cm; line-height: 108%"><b>Security: </b>
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">All payment
details which are entered through this payment gateway are encrypted
when the Student, or third party making payment, enters them. The
site is secure and uses 128-bit encryption to offer secure
communications by encrypting all data to and from the site The SHREYA
HOSPITALITY SERVICES PVT LTD shall not be liable for any failure by
the Student or third party making payment of Payment to properly
protect data from being seen on their screen by other persons or
otherwise obtained by such other persons, during the Online Payment
process or in respect of any omission to provide accurate information
in the Course of the Online Payment Process. 
</p>
</br>
<p style="margin-bottom: 0.28cm; line-height: 108%"><b>Variations to
the Terms and Conditions: </b>
</p>
<p style="margin-bottom: 0.28cm; line-height: 108%">The SHREYA
HOSPITALITY SERVICES PVT LTD reserves the right to vary these Terms
and Conditions from time to time and the current version will be that
published on this mobile app. We reserve the right to decline the
acceptance of an online payment if your account is in default for any
reason. SHREYA HOSPITALITY SERVICES PVT LTD may also make
additions/deletions/alteration to the services offered, at its sole
discretion. We reserves the right to withdraw the service at any time
at its discretion. We retain the right to change the terms and
conditions for Online Payment Payments, without any prior notice.</p>
<div title="footer"><p style="margin-top: 1.17cm; margin-bottom: 0cm; line-height: 100%">
	<br/>

	</p>
</div>
</body>
</html>''';
}
