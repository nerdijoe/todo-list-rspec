class List
  attr_reader :title, :tasks

  def initialize(title, tasks = [])
    @title = title
    @tasks = tasks
  end

  def add_task(task)
    tasks << task
  end

  def complete_task(index)
    if tasks[index].nil?
      "index invalid"
    else
      tasks[index].complete!
    end
  end

  def delete_task(index)
    if tasks[index].nil?
      "index invalid"
    else
      tasks.delete_at(index)
    end
  end

  def completed_tasks
    tasks.select { |task| task.complete? }
  end

  def incomplete_tasks
    tasks.select { |task| !task.complete? }
  end
end
