abstract class Configs {
  static const baseURL = 'http://44.207.156.168';
  //static const baseURL = 'https://9a23-185-220-180-70.eu.ngrok.io';
  static const serverURl = "$baseURL/auctionHUb";
  static const info = "$baseURL/Info/";
  static const getAllInfo = "$baseURL/api/mobile/InfoPage/GetAll";
  static const login = "$baseURL/api/mobile/Accaount/Login";
  static const pinCode = "$baseURL/api/mobile/Accaount/ApproveTwoFactor";
  static const allFarm = "$baseURL/api/mobile/Farm/GetAll";
  static const allAuction = "$baseURL/api/mobile/Auction/GetAll";
  static const joinAuction = "$baseURL/api/mobile/Auction/Join";
  static const startAuction =
      "$baseURL/api/mobile/Auctioning/StartAuction?auctionId=";
  static const getAuctionLots = "$baseURL/api/mobile/Auction/GetAuctionLots";
  static const allFarmPurpose = "$baseURL/api/mobile/Farm/GetFarmPurpouse";
  static const allLiveStock = "$baseURL/api/mobile/LiveStock/GetAll";
  static const detailedLiveStock = "$baseURL/api/mobile/LiveStock/GetDetailed";
  static const getUserStatus = "$baseURL/api/mobile/Auction/GetUserStatus";
  static const getProfileInfo = "$baseURL/api/mobile/Accaount/GetProfilInfo";
  static const sendUpdateNumberSms =
      "$baseURL/api/mobile/Accaount/SendUpdateNumberSms";
  static const updateNumber = "$baseURL/api/mobile/Accaount/UpdateNumber";
  static const getLotHistories = "$baseURL/api/mobile/UserLotHistory/GetAll";
  static const getLotHistoriesWin = "$baseURL/api/mobile/UserLotHistory/GetWin";
  static const getLotHistoriesLose =
      "$baseURL/api/mobile/UserLotHistory/GetLose";
  static const getLotHistoryDetailed =
      "$baseURL/api/mobile/UserLotHistory/GetDetailed?id=";
  static const sendFcmToken = "$baseURL/api/mobile/FCMToken/AddFCMTokenToUser";
}
