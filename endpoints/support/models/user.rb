class User

  attr_accessor :id, :firstName, :lastName, :role, :userName, :password,
                :emailAddress, :token, :tokenExpDate, :activeFlag, :company_href, :company_name, :href

  def to_json
    {
        href: self.href,
        id: self.id,
        firstName: self.firstName,
        lastName: self.lastName,
        company: {
          href: self.company_href,
          name: self.company_name
      },
        role: self.role,
        userName: self.userName,
        password: self.password,
        emailAddress: self.emailAddress,
        token: self.token,
        tokenExpDate: self.tokenExpDate,
        activeFlag: self.activeFlag
    }.to_json
  end

  def to_hash
    {
        href: self.href,
        id: self.id,
        firstName: self.firstName,
        lastName: self.lastName,
        company: {
            href: self.company_href,
            name: self.company_name
        },
        role: self.role,
        userName: self.userName,
        password: self.password,
        emailAddress: self.emailAddress,
        token: self.token,
        tokenExpDate: self.tokenExpDate,
        activeFlag: self.activeFlag
    }
  end

  def create_to_hash
    {
        firstName: self.firstName,
        lastName: self.lastName,
        company: {
            href: self.company_href,
            name: self.company_name
        },
        role: self.role,
        userName: self.userName,
        password: self.password,
        emailAddress: self.emailAddress
    }
  end

  def create_to_json
    {
        firstName: self.firstName,
        lastName: self.lastName,
        company: {
            href: self.company_href,
            name: self.company_name
        },
        role: self.role,
        userName: self.userName,
        password: self.password,
        emailAddress: self.emailAddress
    }.to_json
  end

  def update_to_hash
    {
        firstName: self.firstName,
        lastName: self.lastName,
        role: self.role,
        password: self.password,
        emailAddress: self.emailAddress
    }
  end

  def update_to_json
    {
        firstName: self.firstName,
        lastName: self.lastName,
        role: self.role,
        password: self.password,
        emailAddress: self.emailAddress
    }.to_json
  end

  def search_to_hash
    {
        firstName: self.firstName,
        lastName: self.lastName,
        role: self.role,
        userName: self.userName,
        password: self.password,
        activeFlag: self.activeFlag,
        emailAddress: self.emailAddress
    }
  end

  def search_to_json
    {
        firstName: self.firstName,
        lastName: self.lastName,
        role: self.role,
        userName: self.userName,
        password: self.password,
        activeFlag: self.activeFlag,
        emailAddress: self.emailAddress
    }.to_json
  end
end