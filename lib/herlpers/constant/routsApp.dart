import 'package:flowers_store/herlpers/constant/midelware_app.dart';
import 'package:flowers_store/views/pages/auth/forget_password/forget_password_page.dart';
import 'package:flowers_store/views/pages/auth/forget_password/changed_password_page.dart';
import 'package:flowers_store/views/pages/auth/forget_password/create_new_password_page.dart';
import 'package:flowers_store/views/pages/auth/login/login_page.dart';
import 'package:flowers_store/views/pages/auth/otp_verification_page.dart';
import 'package:flowers_store/views/pages/auth/signup/signup_view.dart';
import 'package:flowers_store/views/pages/auth/welcome_page.dart';
import 'package:flowers_store/views/pages/categories/categories_details_page.dart';
import 'package:flowers_store/views/pages/checkout/congratulation_page.dart';
import 'package:flowers_store/views/pages/coaches/all_coach_courses.dart';
import 'package:flowers_store/views/pages/coaches/coach_details_page.dart';
import 'package:flowers_store/views/pages/coaches/coach_profile.dart';
import 'package:flowers_store/views/pages/coaches/coache_registration_page.dart';
import 'package:flowers_store/views/pages/coaches/coaches_list_page.dart';
import 'package:flowers_store/views/pages/courses/all_courses_page.dart';
import 'package:flowers_store/views/pages/courses/check_out_course_page.dart';
import 'package:flowers_store/views/pages/courses/course_details_page.dart';
import 'package:flowers_store/views/pages/courses/courses_page.dart';
import 'package:flowers_store/views/pages/flowrist/profile/flowerist_edit_profile_view.dart';
import 'package:flowers_store/views/pages/flowrist/flowrist_list.dart';
import 'package:flowers_store/views/pages/flowrist/flowrist_profile.dart';
import 'package:flowers_store/views/pages/notifications/notification_page.dart';
import 'package:flowers_store/views/pages/profile/schedule/add_edit_schedule_page.dart';
import 'package:flowers_store/views/pages/navigation/cart_view.dart';
import 'package:flowers_store/views/pages/navigation/favourites_view.dart';
import 'package:flowers_store/views/pages/navigation/home_view.dart';
import 'package:flowers_store/views/pages/navigation/nav_screen.dart';
import 'package:flowers_store/views/pages/navigation/profile_view.dart';
import 'package:flowers_store/views/pages/onboarding/onboarding_screen.dart';
import 'package:flowers_store/views/pages/categories/categories_page.dart';
import 'package:flowers_store/views/pages/checkout/checkout_page.dart';
import 'package:flowers_store/views/pages/product/products_details_page.dart';
import 'package:flowers_store/views/pages/profile/language_page.dart';
import 'package:flowers_store/views/pages/profile/address/edit_or_add_address_page.dart';
import 'package:flowers_store/views/pages/profile/credit_coupon_page.dart';
import 'package:flowers_store/views/pages/profile/invite_friends_page.dart';
import 'package:flowers_store/views/pages/profile/address/my_addresses_page.dart';
import 'package:flowers_store/views/pages/profile/my_order_page.dart';
import 'package:flowers_store/views/pages/profile/payment/add_payment_page.dart';
import 'package:flowers_store/views/pages/profile/payment/edit_payment_page.dart';
import 'package:flowers_store/views/pages/profile/payment/payment_page.dart';
import 'package:flowers_store/views/pages/profile/profile_page.dart';
import 'package:flowers_store/views/pages/profile/shipping_address_page.dart';
import 'package:flowers_store/views/pages/reviews/all_reviews_page.dart';
import 'package:flowers_store/views/pages/splash_screen.dart';
import 'package:flowers_store/views/pages/supplier/profile/supplier_profile_page.dart';
import 'package:get/route_manager.dart';
import 'package:flowers_store/views/pages/product/products_page.dart';
import '../../views/pages/navigation/others_view.dart';
import '../../views/pages/flowrist/flowrist_registeration.dart';
import '../../views/pages/product/image_gallery.dart';
import '../../views/pages/flowrist/pending_request.dart';
import '../../views/pages/flowrist/request_approval.dart';

const kSplashScreen = "/SplashScreen";
const kBottomNavigationScreen = "/BottomNavigationScreen";
const konBoardingScreen = "/onBoardingScreen";
const kHomepage = "/Homepage";
const kHomeScreenView = "/HomeScreen";
const kFavouriteView = "/FavouriteView";
const kCartView = "/CartView";
const kProfileView = "/ProfileView";
const kOthersView = "/OthersView";
const kProductsPage = "/ProductsPage";
const kProdoctDetailsPage = "/ProdoctDetailsPage";
const kAllCategoriesPage = "/AllCategoriesPage";
const kImagesGallery = "/GalleryImages";
const kFlowristRegistration = "/FlowristRegistration";
const kPendingRequest = "/PendingRequest";
const kRequestApproval = "/RequestApproval";
const kCheckoutPage = "/CheckoutPage";
const kWelcomePage = "/WelcomePage";
const kOnboardingPage = "/onboardingPage";
const kLoginPage = "/LoginPage";
const kSignupView = "/kSignupView";
const kForgetPasswordPage = "/ForgetPasswordPage";
const kOtpVerificationPage = "/OtpVerificationPage";
const kCreateNewPasswordPage = "/CreateNewPasswordPage";
const kChangedPasswordPage = "/ChangedPasswordPage";
const kCoacheRegistrationPage = "/CoacheRegistrationPage";
const kCongratulationPage = "/CongratulationPage";
const kCoachesListPage = "/CoachesListPage";
const kCoachDetailsPage = "/CoachDetailsPage";
const kFlowristList = "/FlowristList";
const kFloweristProfile = "/FloweristProfile";
const kCoursesPage = "/CoursesPage";
const kCourseDetailsPage = "/CourseDetailsPage";
const kInviteFriendsPage = "/InviteFriendsPage";
const kShippingAddressPage = "/kShippingAddressPage";
const kCheckOutCoursePage = "/kCheckOutCoursePage";
const kMyOrderPage = "/MyOrderPage";
const kCreditCouponPage = "/CreditCouponPage";
const kAllReviewsPage = "/AllReviewsPage";
const kAllCoachCoursesPage = "/AllCoachCoursesPage";
const kAllCoursesPage = "/AllCoursesPage";
const kFloweristEditProfileView = "/FloweristEditProfileView";
const kAddEditSchedulePage = "/AddEditSchedulePage";
const kCategoriesDetailsPage = "/CategoriesDetailsPage";
const kCoachProfile = "/CoachProfile";
const kSupplierProfilePage = "/SupplierProfilePage";
const kMyProfilePage = "/MyProfilePage";
const kPaymnetPage = "/PaymentPage";
const kAddPaymentPage = "/AddPaymentPage";
const kEditPaymentPage = "/EditPaymentPage";
const kMyAddressesPage = "/MyAddressesPage";
const kEditOrAddAddressPage = "/kEditOrAddAddressPage";
const kLanguagePage = "/LanguagePage";
const kNotificationPage = "/NotificationPage";

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: "/",
    page: () => const SplashScreen(),
    middlewares: [AppMiddleWare()],
  ),
  GetPage(name: kOnboardingPage, page: () => const OnBoardingScreen()),
  GetPage(name: kBottomNavigationScreen, page: () => const BottomNavigationScreen()),
  GetPage(name: kHomeScreenView, page: () => const HomePage()),
  GetPage(name: kFavouriteView, page: () => const FavouriteView()),
  GetPage(name: kCartView, page: () => const CartView()),
  GetPage(name: kProfileView, page: () => const ProfileView()),
  GetPage(name: kOthersView, page: () => const OthersView()),
  GetPage(name: kProductsPage, page: () => const ProductsPage()),
  GetPage(name: kProdoctDetailsPage, page: () => const ProdoctDetailsPage()),
  GetPage(name: kAllCategoriesPage, page: () => const CategoriesPage()),
  GetPage(name: kImagesGallery, page: () => const ImagesGallery()),
  GetPage(name: kWelcomePage, page: () => const WelcomePage()),
  GetPage(name: kLoginPage, page: () => const LoginPage()),
  GetPage(name: kSignupView, page: () => const SignupView()),
  GetPage(name: kForgetPasswordPage, page: () => const ForgetPasswordPage()),
  GetPage(name: kOtpVerificationPage, page: () => OtpVerificationPage()),
  GetPage(name: kCreateNewPasswordPage, page: () => const CreateNewPasswordPage()),
  GetPage(name: kChangedPasswordPage, page: () => const ChangedPasswordPage()),
  GetPage(name: kCheckoutPage, page: () => CheckoutPage()),
  GetPage(name: kFlowristRegistration, page: () => const FlowristRegistration()),
  GetPage(name: kPendingRequest, page: () => const PendingRequest()),
  GetPage(name: kRequestApproval, page: () => const RequestApproval()),
  GetPage(name: kCoacheRegistrationPage, page: () => const CoacheRegistrationPage()),
  GetPage(name: kCongratulationPage, page: () => const CongratulationPage()),
  GetPage(name: kCoachesListPage, page: () => const CoachesListPage()),
  GetPage(name: kCoachDetailsPage, page: () => const CoachDetailsPage()),
  GetPage(name: kFlowristList, page: () => const FlowristList()),
  GetPage(name: kFloweristProfile, page: () => const FloweristProfile()),
  GetPage(name: kCoursesPage, page: () => const CoursesPage()),
  GetPage(name: kCourseDetailsPage, page: () => const CourseDetailsPage()),
  GetPage(name: kInviteFriendsPage, page: () => const InviteFriendsPage()),
  GetPage(name: kShippingAddressPage, page: () => const ShippingAddressPage()),
  GetPage(name: kCheckOutCoursePage, page: () => const CheckOutCoursePage()),
  GetPage(name: kMyOrderPage, page: () => const MyOrderPage()),
  GetPage(name: kCreditCouponPage, page: () => const CreditCouponPage()),
  GetPage(name: kAllReviewsPage, page: () => const AllReviewsPage()),
  GetPage(name: kAllCoachCoursesPage, page: () => const AllCoachCoursesPage()),
  GetPage(name: kAllCoursesPage, page: () => const AllCoursesPage()),
  GetPage(
      name: kFloweristEditProfileView, page: () => const FloweristEditProfileView()),
  GetPage(name: kAddEditSchedulePage, page: () => const AddEditSchedulePage()),
  GetPage(name: kCategoriesDetailsPage, page: () => const CategoriesDetailsPage()),
  GetPage(name: kCoachProfile, page: () => const CoachProfile()),
  GetPage(name: kSupplierProfilePage, page: () => const SupplierProfilePage()),
  GetPage(name: kMyProfilePage, page: () => const MyProfilePage()),
  GetPage(name: kPaymnetPage, page: () => const PaymentPage()),
  GetPage(name: kAddPaymentPage, page: () => const AddPaymentPage()),
  GetPage(name: kEditPaymentPage, page: () => const EditPaymentPage()),
  GetPage(name: kMyAddressesPage, page: () => const MyAddressesPage()),
  GetPage(name: kEditOrAddAddressPage, page: () => const EditOrAddAddressPage()),
  GetPage(name: kLanguagePage, page: () => const LanguagePage()),
  GetPage(name: kNotificationPage, page: () => const NotificationPage()),
];
