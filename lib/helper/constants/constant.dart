// ignore_for_file: constant_identifier_names

class App {
  static const appName = "App";
  static const buildMode = "build_mode";
  static const baseUrl = "base_url";
  static const baseKey = "base_key";
  static const baseIV = "base_iv";
  static const plnSsoUrl = 'pln_sso_url';
  static const plnSsoAppSource = 'pln_sso_app_source';
}

class AppError {
  static const locationDenied = "location_denied";
  static const locationDeniedForever = "location_denied_forever";
  static const locationDisabled = "location_disabled";
}

class AppString {
  static const empty = "";
  static const dash = "–";
}

class Arg {
  static const ccv = "ccv";
  static const isApproval = "is_approval";
  static const isApprove = "is_approve";
  static const isNewPage = "is_new_page";
  static const isReject = "is_reject";
  static const isUpdated = "is_updated";
  static const mode = "mode";
  static const permit = "permit";
  static const photos = "photos";
  static const procedure = "procedure";
  static const riskContainment = "risk_containment";
  static const selectedId = "selected_id";
  static const title = "title";
  static const type = "type";
  static const finding = "finding";
  static const uri = "uri";
}

class Build {
  static const development = "Development";
  static const production = "Production";
}

class DatePattern {
  static const dd = "dd";
  static const mm = "MM";
  static const yy = "yy";
  static const mmss = "mm:ss";
  static const HHmm = "HH:mm";
  static const dMMM = "d MMM";
  static const dMMMyy = "d MMM yy";
  static const dMMMMyyyy = "d MMMM yyyy";
  static const dMMMMyyyyHHmm = "d MMMM yyyy HH:mm";
  static const MMMMyyyy = "MMMM yyyy";
  static const yyyyMMdd = "yyyy-MM-dd";
  static const yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss";
  static const yyyyMMddHHmmssSSS = "yyyy-MM-dd HH:mm:ss.SSS";
  static const utc = "yyyy-MM-dd'T'HH:mm:ss";
}

class FilterDateType {
  static const thisMonth = "this_month";
  static const last30 = "last_30";
  static const last90 = "last_390";
  static const custom = "custom";
}

class Mode {
  static const read = "read";
  static const write = "write";
  static const update = "update";
}

class Module {
  static const ccv = "ccv";
  static const ccvPermit = "ccv_permit";
  static const finding = "finding";
  static const findingApproval = "finding_approval";
  static const permit = "permit";
  static const permitApproval = "permit_approval";
}

class Network {
  static const appSource = "App-Source";
  static const contentJson = "application/json";
  static const headerAuth = "Authorization";
}

class Time {
  static const oneSec = 1000;
  static const oneMin = 60000;
}
