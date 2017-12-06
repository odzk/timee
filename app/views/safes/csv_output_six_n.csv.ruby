require 'csv'

CSV.generate do |csv|
  csv_column_names = ["ID","メーカー","機器タイプ","機種名","倉庫","本体番号","セル番号","枠番号","スロット番号","入庫日時","出庫日時","入庫先","出庫先","入庫登録者","出庫登録者","撤去日","検定日","パネル色","備考","書類１","書類２","書類３","状態"]
  csv << csv_column_names
  @safes.each do |safe|
    csv_column_values = [
      safe.id,
      safe.maker,
      safe.type_machine,
      safe.name,
      safe.place,
      "なし",
      "なし",
      "なし",
      safe.number_slot,
      safe.created_at,
      safe.date_of_out,
      safe.from,
      safe.to,
      safe.staff,
      safe.staff_two,
      safe.date_of_removal,
      safe.date_of_verification,
      safe.color_of_panel,
      safe.remarks,
      safe.paper1,
      safe.paper2,
      safe.paper3,
      safe.status
    ]
    csv << csv_column_values
  end
end