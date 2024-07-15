const String serverNameLink = "https://flowers-ecommerce-dev.onrender.com/api/v1";
//// auth
//https://flowers-ecommerce-dev.onrender.com/api/v1/auth/customer/signup
const String signupNameLink = "$serverNameLink/auth/customer/signup";
const String loginNameLink = "$serverNameLink/auth/login";
const String verifyNameLink = "$serverNameLink/otp";
const String sendCodeNameLink = "$serverNameLink/auth/customer/";
const String logOutNameLink = "$serverNameLink/auth/logout";

///This end points used in ForgetPassword Operation
const String forgetPasswordLink = "$serverNameLink/auth/customer/public/";
const String verifyResetPassOtpLink = "$serverNameLink/otp/verify/";

//home
const String getallProductsNameLink = "$serverNameLink/products";

//cart
const String getMyCartNameLink = "$serverNameLink/carts";
const String addToMyCartNameLink = "$serverNameLink/products/";
const String increaseMyCartNameLink = "$serverNameLink/carts/items/";
const String decreaseCartNameLink = "$serverNameLink/carts/items/";
const String removeItemNameLink = "$serverNameLink/carts/items/";
//Floriest
const String floristSignupNameLink = "$serverNameLink/auth/florist/signup";
const String getFoloristInfoNameLink = "$serverNameLink/florists/me";
const String uploadFloristWorkImageNameLink = "$serverNameLink/florists/work";
String deleteFloristWorkImageNameLink({required String id}) =>"$serverNameLink/florists/work/$id";
String getFloristOrdersNameLink({required String search, required String status}) =>
    "$serverNameLink/florists/reservations?${search.isEmpty ? 'search=' : 'search=$search'}${status.isEmpty ? '&' : '&status=$status'}";

//Get Users Data
const String customerDataLink = "$serverNameLink/customers/me";

///Schedule
const String createScheduleNameLink = "$serverNameLink/schedule";
String deleteScheduleNameLink({required String id}) => "$serverNameLink/schedule/$id";
//Favourites
const String getFavouriteNameLink = "$serverNameLink/favorites";
const String addToFavouriteNameLink = "$serverNameLink/products/";

//reviews
String allReviewsLink({required String id}) =>
    "$serverNameLink/products/$id/reviews";
String createReviewLink({required String id}) =>
    "$serverNameLink/products/$id/reviews";

//categories
const String getCategoriesNameLink = "$serverNameLink/categories";

//profile
const String getUserNameLink = "$serverNameLink/customers/me";


//Addresses
String getUserAddresses(
        {// String sort = "-floorNumber",
        int filter = 99,
        required int pageNum,
        int limit = 5}) =>
    "$serverNameLink/addresses?filter=buildingNumber=lte:$filter&page=$pageNum&limit=$limit";

String createSpecificAddress({required String id}) =>
    "$serverNameLink/addresses/$id";

String createDeleteAddress({required String id}) =>
    "$serverNameLink/addresses/$id";

const String createOrdinaryAddressNameLink = "$serverNameLink/addresses";
