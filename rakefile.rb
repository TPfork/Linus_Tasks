# coding: utf-8
require 'rake'

OUT = "out/"
MAIN = "src/main"
TESTS = "src/test"
RESOURCES = "src/resources"

def lang_list()
	list = Array.new
	Dir.glob(File.join(MAIN, '*')) {|lang|
    list << File.split(lang).last
  }
	list
end

def task_list(lang)
  puts lang
	list = Array.new
	Dir.glob(File.join(MAIN, lang, '*')) {|task|
		list << File.split(task).last
	} 
	list
end

def input_file(task)
  File.expand_path(File.join(RESOURCES, task, 'input.txt'))
end

def output_file(task)
  File.expand_path(File.join(RESOURCES, task, 'output.txt'))
end


task :default do
	puts 'Для запуска задачи введите команду:'
	puts "\trake [lang]:[task]"
	puts "\nПараметры:"
	puts "\tlang - выбор языка программирования " + lang_list().to_s
	puts "\ttask - выбор задачи. Пример: task3"

	puts "\n\nПример команды:"
	puts "\trake java:task2 - запустит решение второй задачи на языке java (если такое имеется)"
end

RUBY_FOLDER = 'ruby'
namespace RUBY_FOLDER do
    task_list(RUBY_FOLDER).each { |t|
      task t do
        ruby File.join(MAIN, RUBY_FOLDER, t, 'main.rb'), input_file(t), output_file(t)
      end
    }
end

