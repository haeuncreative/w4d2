class Employee

    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end


end

class Manager < Employee

    attr_accessor :employees

    def initialize(name, title, salary, boss)
        super
        @employees = Array.new
    end

    def << (person)
        @employees << person
    end

    def bonus(multiplier)
        sum = 0
        @employees.each do |employee|
            sum += employee.salary
        end
        sum * multiplier
    end
end