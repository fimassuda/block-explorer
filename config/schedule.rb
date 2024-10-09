set :output, "log/cron.log"

every 1.minute do
  rake fetch_transactions:near
end
