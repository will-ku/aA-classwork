class Employee #daren

    def initialize(name,title,salary, boss=nil, manager=false)
        @name = name
        @title = title
        @salary = salary.to_i
        @boss = boss
        @manager = manager
    end

    def bonus(multiplier)
        salary * multiplier
    end

    def inspect
        @name
    end

    attr_reader :manager
    attr_accessor :boss, :salary
end

class Manager < Employee  # this manager can also have a manager

    def initialize(name,title,salary, boss=nil, manager=true)
        super(name,title,salary,boss, manager)
        @employees = []
        @boss = boss
    end

    def intake_employee(emp_inst) # do we want to return any data?
        employees << emp_inst
        emp_inst.boss = self
        p employees
    end

    def bonus(multiplier)
        p self.salary_sum * multiplier
    end

    def salary_sum
        sum = 0
        employees.each do |emp|
            if emp.manager == true
                sum += emp.salary
                sum += emp.salary_sum    
            else 
                sum += emp.salary
            end
        end
        return sum
    end
    
    attr_reader :manager
    attr_accessor :employees
end

# How do we link the employee to the boss? Let's assume manager is initialized first

darren = Manager.new("Darren", "TA Manager", 78000)
ned = Manager.new("Ned", "Founder", 1000000)
shawna = Employee.new("Shawna", "TA", 12000)

ned.intake_employee(darren)
darren.intake_employee(shawna)

ned.bonus(2)
# p ned.bonus(2)

