abstract class AppStates {}

class InitialState extends AppStates {}

class BottomNavChangedState extends AppStates {}

class ThemeChangedState extends AppStates {}
class ChangeLanguageContainerStatusState extends AppStates {}
class PrimaryColorIndexState extends AppStates {}
class ChangeThemeContainerStatusState extends AppStates {}

class ChangeAppLanguageState extends AppStates {}
class ChangeAppLanguageSuccessState extends AppStates {}
class pickDateState extends AppStates {}
class changeGenderState extends AppStates {}
class drobDownCountryState extends AppStates {}
class changeCountryState extends AppStates {}
class changeJobState extends AppStates {}

class OnBoardingPageViewChangedState extends AppStates {}

//<editor-fold desc="SplashStates">
class SplashscreenLoading extends AppStates {}
//</editor-fold>

class getFirstModeState extends AppStates {}


class SignUpInitialState extends AppStates{}
class SignUpSuccessState extends AppStates{}
class SignUpErrorState extends AppStates{}

class LogInInitialState extends AppStates{}

class LogInSuccessState extends AppStates{}

class LogInErrorState extends AppStates{}

class resetInitialState extends AppStates{}
class resetSuccessState extends AppStates{}
class resetErrorState extends AppStates{}
class ChangePasswordVisibilityState extends AppStates{}
class UpdateNotificationStatus extends AppStates{}
class SaveNotificationStatus extends AppStates{}

class GetNotificationSuccessState extends AppStates{}
class GetNotificationErrorState extends AppStates{}
class GetNotificationUpdateState extends AppStates{}

class GetUserLoadingState extends AppStates{}
class GetUserSuccessState extends AppStates{}
class GetUserErrorState extends AppStates
{
  final String error;

  GetUserErrorState(this.error);
}
class ProfileImagePickedSuccessState extends AppStates {}

class ProfileImagePickedErrorState extends AppStates {}

// States for Cover Pick

class CoverPickedSuccessState extends AppStates {}

class CoverPickedErrorState extends AppStates {}

// States for Upload Profile Photo

class UploadProfileSuccessState extends AppStates {}

class UploadProfileErrorState extends AppStates {}

// States for Upload Cover

class UploadCoverSuccessState extends AppStates {}

class UploadCoverErrorState extends AppStates {}

// States for User Update Changes

class UserUpdateLoadingState extends AppStates {}

class UserUpdateSuccessState extends AppStates {}

class UserUpdateErrorState extends AppStates {}

// States for Creat Post

class ChangeBottomSheetState extends AppStates{}

class getCoinState extends AppStates{}

class updateCoinState extends AppStates{}
class ChangeRewardStepState extends AppStates{}
class UpdateBannerState extends AppStates{}

/*
//states for IdentificationScreen


class IncrementActiveStepState extends AppStates{}

class DecrementActiveStepState extends AppStates{}

class PickImageForMatchCardLoadingState extends AppStates{}

class PickImageForMatchCardSuccessState extends AppStates{}

class PickImageForMatchCardErrorState extends AppStates{}

class RemoveFrontImageState extends AppStates{}

class RemoveBackImageState extends AppStates{}

class RemoveMatchImageState extends AppStates{}


class UploadCardImagesLoadingState extends AppStates{}

class UploadCardImagesSuccessState extends AppStates{}

class UploadCardImagesErrorState extends AppStates{}
*/


