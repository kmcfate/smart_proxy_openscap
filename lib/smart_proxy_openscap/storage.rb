require 'smart_proxy_openscap/openscap_exception'
require 'openscap'
require 'openscap/ds/arf'

module Proxy::OpenSCAP
  class Storage
    include ::Proxy::Log

    def initialize(path_to_dir, cname, id, date)
      @namespace = 'arf'
      @cname = cname
      @id = id
      @date = date
      validate_id(@id)
      @path_to_dir = path_to_dir
      @path = "#{@path_to_dir}/#{@namespace}/#{@cname}/#{@id}/#{@date}/"
    end

    def store_archive(full_path, data)
      raise NotImplementedError
    end

    def store_spool(full_path, data)
      raise NotImplementedError
    end

    def store_failed(full_path, data)
      raise NotImplementedError
    end

    def get_arf_xml(full_path, digest)
      raise NotImplementedError
    end

    def get_arf_html(full_path, digest)
      raise NotImplementedError
    end

    def delete_arf_file
      raise NotImplementedError
    end

    private

    def validate_id(id)
      raise Proxy::OpenSCAP::OpenSCAPException, 'Malformed ARF ID' unless /\A\d+\Z/ =~ id
    end
  end
end
