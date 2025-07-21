// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get home => 'Trang chủ';

  @override
  String get statistics => 'Thống kê';

  @override
  String get statistics_description => 'Thông tin uống nước của bạn';

  @override
  String get settings => 'Cài đặt';

  @override
  String get settings_description => 'Tùy chỉnh trải nghiệm của bạn';

  @override
  String dailyGoalText(Object value, Object unit) {
    return 'trên $value$unit mục tiêu/ngày';
  }

  @override
  String remaining(Object value, Object unit) {
    return 'còn lại $value$unit';
  }

  @override
  String get custom => 'Tùy chỉnh';

  @override
  String get recent => 'Gần đây';

  @override
  String get more => 'Mở rộng';

  @override
  String get no_water_intake_data => 'Bạn chưa uống chút nước nào hôm nay.';

  @override
  String get day_streak => 'Chuỗi Ngày';

  @override
  String get weekly_avg => 'TB Tuần';

  @override
  String get this_week => 'Tuần Này';

  @override
  String get this_month => 'Tháng Này';

  @override
  String get mon => 'T2';

  @override
  String get tue => 'T3';

  @override
  String get wed => 'T4';

  @override
  String get thu => 'T5';

  @override
  String get fri => 'T6';

  @override
  String get sat => 'T7';

  @override
  String get sun => 'CN';

  @override
  String get goals_met => 'Đạt Mục Tiêu';

  @override
  String get success_rate => 'Hoàn Thành';

  @override
  String get profile => 'Hồ sơ';

  @override
  String get your_name => 'Tên của bạn';

  @override
  String get daily_goal => 'Mục tiêu mỗi ngày';

  @override
  String get advanced_mode => 'Chế độ nâng cao';

  @override
  String advanced_mode_description(Object value, Object unit) {
    return 'Mở khóa mục tiêu lên $value$unit';
  }

  @override
  String get advanced_mode_dialog =>
      'Hãy hỏi ý kiến bác sĩ nếu đặt mục tiêu uống nước cao. Uống quá nhiều có thể gây hại đến sức khỏe.';

  @override
  String get change_daily_goal => 'Thay đổi mục tiêu mỗi ngày';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get cancel => 'Hủy';

  @override
  String get change_daily_goal_dialog =>
      'Bạn có chắc muốn thay đổi mục tiêu mỗi ngày?';

  @override
  String get appearance => 'Giao diện';

  @override
  String get dark_mode => 'Chế độ tối';

  @override
  String get dark_mode_description => 'Chuyển sang giao diện tối';

  @override
  String get units => 'Đơn vị';

  @override
  String get units_description => 'Mililít hoặc ounce';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get reminders => 'Nhắc nhở';

  @override
  String get enable_reminders => 'Bật nhắc nhở';

  @override
  String get enable_reminders_description => 'Nhận thông báo uống nước';

  @override
  String get sound_effects => 'Âm thanh';

  @override
  String get sound_effects_description => 'Phát âm thanh khi nhắc nhở';

  @override
  String get reminder_interval => 'Khoảng cách nhắc nhở';

  @override
  String get sleep_hours => 'Giờ ngủ';

  @override
  String get sleep_hours_description => 'Tạm dừng nhắc nhở trong thời gian này';

  @override
  String get hydration_calculator => 'Máy tính lượng nước';

  @override
  String get hydration_calculator_description =>
      'Tính toán mục tiêu uống nước hằng ngày của bạn dựa trên cân nặng và mức độ vận động';

  @override
  String get body_weight => 'Cân nặng';

  @override
  String get daily_exercise_time => 'Thời gian tập mỗi ngày';

  @override
  String get recommended_daily_intake => 'Lượng khuyến nghị mỗi ngày';

  @override
  String base(Object value) {
    return 'Cơ bản: $value (dựa trên cân nặng)';
  }

  @override
  String exercise(Object value, Object min) {
    return 'Tập luyện: +$value (tập $min phút)';
  }

  @override
  String get apply_recommended_goal => 'Áp dụng mục tiêu khuyến nghị';

  @override
  String apply_recommended_goal_success_dialog(Object value, Object unit) {
    return 'Mục tiêu mới của bạn sẽ được đặt thành $value$unit. Bạn có muốn áp dụng thay đổi này không?';
  }

  @override
  String apply_recommended_goal_failure_dialog(
    Object value1,
    Object value2,
    Object unit,
  ) {
    return 'Mục tiêu nên nằm trong khoảng từ $value1$unit đến $value2$unit. Hãy điều chỉnh và thử lại nhé!';
  }

  @override
  String get invalid_goal_amount => 'Mức mục tiêu không hợp lệ';

  @override
  String get close => 'Đóng';

  @override
  String get quick_add_amounts => 'Tùy chỉnh thêm nhanh';

  @override
  String get quick_add_amounts_description =>
      'Thiết lập các nút thêm nhanh để ghi nhận lượng nước bạn thường uống.';

  @override
  String get button => 'Nút';

  @override
  String get tip => 'Mẹo';

  @override
  String get quick_add_amounts_tip =>
      'Cài đặt các mức thêm nhanh theo dung tích thường dùng (ví dụ: ly, chai nước hoặc cốc bạn hay dùng).';

  @override
  String get reset_to_default_value => 'Đặt lại về mặc định';

  @override
  String get reset_quick_add_confirmation =>
      'Thao tác này sẽ đặt lại các nút thêm nhanh về giá trị mặc định.';

  @override
  String get data_and_storage => 'Dữ liệu & Lưu trữ';

  @override
  String get data_and_storage_description =>
      'Quản lý cách dữ liệu uống nước của bạn được lưu trữ và giữ lại.';

  @override
  String get day => 'Ngày';

  @override
  String get week => 'Tuần';

  @override
  String get month => 'Tháng';

  @override
  String get storage_info => 'Thông tin lưu trữ';

  @override
  String get storage_info_content =>
      'Dữ liệu của bạn được lưu trữ cục bộ trên thiết bị. Thời gian lưu giữ ngắn hơn giúp ứng dụng hoạt động mượt mà hơn.';

  @override
  String get streakTitle0 => 'Hãy bắt đầu từ hôm nay!';

  @override
  String get streakTitle1 => 'Chuỗi ngày đầu tiên!';

  @override
  String streakTitle2(Object value) {
    return 'Chuỗi $value ngày!';
  }

  @override
  String get streakContent0 =>
      'Mọi thói quen đều bắt đầu từ một hành động nhỏ.';

  @override
  String get streakContent1 =>
      'Khởi đầu tuyệt vời! Mỗi hành trình bắt đầu từ một bước đi.';

  @override
  String get streakContent2 =>
      'Bạn đang dần tăng tốc. Những thành công nhỏ đang cộng dồn.';

  @override
  String get streakContent3 =>
      'Tiến bộ vững vàng! Bạn đang hình thành thói quen tốt.';

  @override
  String get streakContent4 =>
      'Tinh thần kiên trì đáng nể. Bạn đang biến điều này thành lối sống.';

  @override
  String get streakContent5 =>
      'Bạn thật sự có thói quen mạnh mẽ! Đây chính là cách thay đổi xảy ra.';

  @override
  String get streakContent6 =>
      'Cam kết đáng khâm phục. Bạn là nguồn cảm hứng cho người khác.';

  @override
  String get streakAction0 => 'Bắt đầu bước đầu tiên';

  @override
  String get streakAction1 => 'Giữ vững đà tiến';

  @override
  String get streakAction2 => 'Tiếp tục đúng hướng';

  @override
  String get streakAction3 => 'Đừng đánh mất nhịp độ';

  @override
  String get streakAction4 => 'Tiếp tục tiến về phía trước';

  @override
  String get streakAction5 => 'Truyền cảm hứng cho người khác';

  @override
  String get streakAction6 => 'Tự hào và tiếp tục cố gắng';

  @override
  String get achievementTitle0 => 'Bắt đầu thôi!';

  @override
  String get achievementTitle1 => 'Khởi đầu rồi!';

  @override
  String get achievementTitle2 => 'Đang tiến triển tốt!';

  @override
  String get achievementTitle3 => 'Hơn nửa chặng đường!';

  @override
  String get achievementTitle4 => 'Sắp hoàn thành!';

  @override
  String get achievementTitle5 => 'Đã hoàn thành mục tiêu!';

  @override
  String get achievementContent0 =>
      'Bạn chưa bắt đầu, nhưng vẫn còn thời gian để chinh phục mục tiêu.';

  @override
  String achievementContent1(Object value) {
    return 'Bạn đã đạt $value% mục tiêu hôm nay. Mỗi bước đều quan trọng!';
  }

  @override
  String achievementContent2(Object value) {
    return 'Bạn đã hoàn thành $value% chặng đường. Giữ vững tinh thần nhé!';
  }

  @override
  String achievementContent3(Object value) {
    return 'Bạn đã đạt $value% mục tiêu. Cố gắng tuyệt vời cho đến nay!';
  }

  @override
  String achievementContent4(Object value) {
    return 'Bạn đã hoàn thành $value%. Chỉ còn chút nữa là đạt mục tiêu!';
  }

  @override
  String get achievementContent5 =>
      'Bạn đã đạt 100% mục tiêu hôm nay. Làm rất tốt!';

  @override
  String get achievementAction0 => 'Bắt đầu ngay';

  @override
  String get achievementAction1 => 'Tiếp tục nhé';

  @override
  String get achievementAction2 => 'Đã đi được nửa đường';

  @override
  String get achievementAction3 => 'Cố thêm chút nữa';

  @override
  String get achievementAction4 => 'Kết thúc thật mạnh mẽ';

  @override
  String get achievementAction5 => 'Chúc mừng thành công';

  @override
  String get benefitTitle => 'Nước mang lại lợi ích gì?';

  @override
  String get benefitAction => 'Tiếp tục duy trì thói quen tốt nhé!';

  @override
  String get fact0 =>
      'Cơ thể bạn chứa khoảng 60% nước - yếu tố quan trọng cho hầu hết chức năng sống.';

  @override
  String get fact1 =>
      'Não bộ có đến 75% là nước. Thiếu nước nhẹ cũng có thể ảnh hưởng đến sự tập trung và tâm trạng.';

  @override
  String get fact2 =>
      'Bạn có thể sống nhiều tuần không ăn, nhưng chỉ vài ngày nếu không uống nước.';

  @override
  String get fact3 =>
      'Uống đủ nước giúp điều hòa thân nhiệt và ngăn ngừa đau đầu.';

  @override
  String get fact4 =>
      'Cấp nước đầy đủ cải thiện tuần hoàn máu và tăng cường hệ miễn dịch.';

  @override
  String get fact5 => 'Nước giúp bảo vệ khớp và cơ bắp khi vận động.';

  @override
  String get fact6 =>
      'Uống đủ nước giúp não hoạt động tốt hơn, tăng khả năng tập trung và ghi nhớ.';

  @override
  String get fact7 =>
      'Nước hỗ trợ tiêu hóa và thúc đẩy quá trình trao đổi chất.';

  @override
  String get fact8 =>
      'Nước giúp vận chuyển dưỡng chất đến tế bào và tăng cường năng lượng.';

  @override
  String get factTitle => 'Bạn có biết?';

  @override
  String get factAction => 'Tiếp tục duy trì thói quen tốt nhé!';

  @override
  String get benefit0 =>
      'Nước giúp thải độc qua thận và giữ cho làn da bạn luôn rạng rỡ.';

  @override
  String get benefit1 =>
      'Cơ thể được cấp nước giúp hỗ trợ khớp và giảm mệt mỏi.';

  @override
  String get benefit2 =>
      'Bạn đang duy trì sự tập trung và minh mẫn nhờ uống đủ nước.';

  @override
  String get benefit3 =>
      'Bạn đang chăm sóc làn da, tâm trạng và sức khỏe tổng thể của mình.';

  @override
  String get benefit4 =>
      'Tim bạn hoạt động hiệu quả hơn khi được cung cấp đủ nước.';

  @override
  String get benefit5 =>
      'Chỉ cần uống đủ nước, cơ thể bạn sẽ cảm thấy dễ chịu hơn rất nhiều.';
}
