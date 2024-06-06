local home = os.getenv 'HOME'
if not home then
  return
end

return {
  { dir = home .. '/Projects/nvim-plugins/nvim-mssql-tools/' },
}
