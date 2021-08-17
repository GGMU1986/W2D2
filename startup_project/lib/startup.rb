require "employee"

class Startup
    attr_reader :name, :funding, :employees, :salaries

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @employees = []
        @salaries = salaries
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_start_up)
        @funding > other_start_up.funding
    end

    def hire(name, title)
        if valid_title?(title)
            @employees << Employee.new(name, title)
        else
            raise "not a valid title!"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding >= @salaries[employee.title]
           employee.pay(@salaries[employee.title])
           @funding -= @salaries[employee.title]
        else
            raise "not enough funding!"
        end
    end

    def payday
        @employees.each { |emp| pay_employee(emp) }
    end

    def average_salary
        sum = 0.0
        @employees.each do |emp|
            sum += @salaries[emp.title] 
        end
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_start_up) 
        @funding += other_start_up.funding
        other_start_up.salaries.each do |k, v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            end
        end
        @employees += other_start_up.employees
        other_start_up.close
    end
end


