def valid_password?(requirement, password)
  char, range = requirement.split(' ')
  min, max = range.split('-').map(&:to_i)
  count = password.count(char)
  count >= min && count <= max
end
  
def count_valid_passwords(file_path)
  valid_passwords = 0

  File.foreach(file_path) do |line|
    requirement, password = line.chomp.split(': ')
    valid_passwords += 1 if valid_password?(requirement, password)
  end

  valid_passwords
end
  
#шлях до вашого файлу для перевірки:
file_path = './file.txt'
puts "The number of valid passwords from file equals #{count_valid_passwords(file_path)}"

# щоб запустити програму - а папці проекту виконайте команду: ruby main.rb 
# за наявності потестувати перевірку паролів на інших прикладах,
# просто змініть текстовий file.txt додавши або стерши якусь зі стрічок