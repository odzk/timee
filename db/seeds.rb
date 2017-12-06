1.times do |n|
 

User.create!(name: "スーパー",
             email: "super@gmail.com",
             password: "caster39",
             password_confirmation: "caster39",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now,
             super_admin: "super"
             )
             
User.create!(name: "ノーマル",
             email: "nomal@gmail.com",
             password: "caster39",
             password_confirmation: "caster39",
             admin:     true,
             super_admin: "権限なし",
             activated: true,
             activated_at: Time.zone.now
             )

User.create!(name: "ハイパー",
             email: "hyper@gmail.com",
             password: "caster39",
             password_confirmation: "caster39",
             admin:     true,
             super_admin: "権限なし",
             hyper: "hyper",
             activated: true,
             activated_at: Time.zone.now
             )
             
             
User.create!(name: "入庫出庫さん",
             email: "syain@gmail.com",
             password: "caster39",
             password_confirmation: "caster39",
             admin:     false,
             super_admin: "権限なし",
             activated: true,
             activated_at: Time.zone.now
             )
             
User.create!(name: "ody",
             email: "ody@gmail.com",
             password: "caster39",
             password_confirmation: "caster39",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now,
             super_admin: "super",
             picture: "assets/ody1.png",
             picture2: "assets/ody1.png",
             picture3: "assets/ody1.png",
             skill: "TOEIC900point",
             job: "Kredo",
             appeal: "Hi, I'm ody",
             hobby: "TV Game",
             country: "Philippines",
             movie: "TIME",
             type_user: "teacher"
             )
             
end    
