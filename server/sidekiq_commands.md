### Clear sidekiq
```ruby
Sidekiq::Queue.all.each(&:clear)
Sidekiq::RetrySet.new.clear
Sidekiq::ScheduledSet.new.clear
Sidekiq::DeadSet.new.clear

Sidekiq.redis {|c| c.del('stat:processed') }
Sidekiq.redis {|c| c.del('stat:failed') }
```
