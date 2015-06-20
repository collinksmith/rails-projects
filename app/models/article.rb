class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect {|s| s.downcase }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  def month
    months = { 1 => 'Jan',
               2 => 'Feb',
               3 => 'Mar',
               4 => 'Apr',
               5 => 'May',
               6 => 'Jun',
               7 => 'Jul',
               8 => 'Aug',
               9 => 'Sep',
               10 => 'Oct',
               11 => 'Nov',
               12 => 'Dec'}
    months[self.created_at.month]
  end

  def self.number_in_month(month_str)
    number_of_articles = 0

    Article.all.each do |article|
      number_of_articles += 1 if article.month.downcase == month_str.downcase
    end

    number_of_articles
  end

  def self.in_month(month_str)
    Article.all.select { |article| article.month.downcase == month_str.downcase }
  end

  def self.full_month(month_str)
    full_months = {jan: 'january',
                     feb: 'february',
                     mar: 'march',
                     apr: 'april',
                     may: 'may',
                     jun: 'june',
                     jul: 'july',
                     aug: 'august',
                     sep: 'september',
                     oct: 'october',
                     nov: 'november',
                     dec: 'december'}
    full_months[month_str.to_sym].capitalize
  end

  def increment_view_count
    if self.view_count.nil?
      self.view_count = 1
    else
      self.view_count += 1
    end
    save
  end

  def self.remove_nils_from_view_count
    Article.all.each do |article|
      if article.view_count.nil?
        article.view_count = 0 
        article.save
      end
    end
  end

  def self.most_views
    Article.remove_nils_from_view_count
    articles_by_views = Article.all.sort_by { |article| article.view_count }.reverse
    articles_by_views[0..2]
  end
end
