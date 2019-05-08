class CustomerDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
    id: { source: "Customer.id" },
    name: { source: "Customer.name"},
    email: { source: "Customer.email" },
    phone: { source: "Customer.phone" },
    }
    end
    def data
    records.map do |record|
    {
    id: record.id,
    name: record.name,
    email: record.email,
    phone: record.phone,
    }
    end
    end
    def get_raw_records
    Customer.all
    end
   

end
