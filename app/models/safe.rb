class Safe < ActiveRecord::Base
include ActionView::Helpers


  def self.to_csv
    CSV.generate do |csv|
      # column_namesはカラム名を配列で返す
      # 例: ["id", "name", "price", "released_on", ...]
      csv << column_names
      all.each do |safe|
        # attributes はカラム名と値のハッシュを返す
        # 例: {"id"=>1, "name"=>"レコーダー", "price"=>3000, ... }
        # valudes_at はハッシュから引数で指定したキーに対応する値を取り出し、配列にして返す
        # 下の行は最終的に column_namesで指定したvalue値の配列を返す
        csv << safe.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.csv_column_names
    ["ID", "機種", "種別", "機器番号", "入庫日時", "出庫日時", "機種名", "倉庫", "入庫登録者", "出庫登録者", "入庫先", "出庫先", "価格", "備考", "
  画像", "状況", "P-sensor"]
  end

  def csv_column_values
    [
    safe.id,
      safe.maker,
      safe.type_machine,
      safe.name,

      
      safe.place,
      
      safe.number[-6..-1],
      safe.number_of_frame[-6..-1],
      safe.number_of_foundation[-6..-1],
      "なし",
      
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
  end
  

  mount_uploader :photo, PictureUploader
  # 画像アップのための準備

  
  validate  :photo
  #画像のサイズについての制限
  #以下、private内のmethodを実行してる

  private
   # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:photo, "5MB以下の画像にしてください。")
        #エラーに１つ加える
      end
    end
  # 画像が重いとエラーだす。
  



  
  

  scope :get_by_maker, ->(maker) {
  where(maker: maker)
  }
  scope :get_by_name, ->(name) {
  where(name: name)
  }
  scope :get_by_easy_date_of_output, ->(easy_date_of_output) {
  where(easy_date_of_output: easy_date_of_output)
  }
  scope :get_by_easy_date_of_input, ->(easy_date_of_input) {
  where(easy_date_of_input: easy_date_of_input)
  }
  scope :get_by_place, ->(place) {
  where(place: place)
  }
  
  
  
# #曖昧
# where('title LIKE(?)', "%c%")
# Event.where('created_at like(?)', "%検索ワード%").count


end
