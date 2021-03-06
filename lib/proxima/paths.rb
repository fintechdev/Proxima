

module Proxima
  module Paths
    module ClassMethods

      def base_uri(base_uri = nil)
        if base_uri.is_a? String
          base_uri_str = base_uri
          base_uri     = ->(m) { base_uri_str }
        end
        @base_uri = base_uri if base_uri
        @base_uri ||= ->(m) { "" }
      end

      def create_path(create_path = nil)
        if create_path.is_a? String
          create_path_str = create_path
          create_path     = ->(m) { create_path_str }
        end
        @create_path = create_path if create_path
        @create_path ||= ->(m) { "#{@base_uri.call(m)}" }
      end

      def find_path(find_path = nil)
        if find_path.is_a? String
          find_path_str = find_path
          find_path     = ->(m) { find_path_str }
        end
        @find_path = find_path if find_path
        @find_path ||= ->(m) { "#{@base_uri.call(m)}" }
      end

      def find_by_id_path(find_by_id_path = nil)
        if find_by_id_path.is_a? String
          find_by_id_path_str = find_by_id_path
          find_by_id_path     = ->(m) { find_by_id_path_str }
        end
        @find_by_id_path = find_by_id_path if find_by_id_path
        @find_by_id_path ||= ->(m) { "#{@base_uri.call(m)}/#{m[:id]}" }
      end

      def update_by_id_path(update_by_id_path = nil)
        if update_by_id_path.is_a? String
          update_by_id_path_str = update_by_id_path
          update_by_id_path     = ->(m) { update_by_id_path_str }
        end
        @update_by_id_path = update_by_id_path if update_by_id_path
        @update_by_id_path ||= ->(m) { "#{@base_uri.call(m)}/#{m[:id]}" }
      end

      def delete_by_id_path(delete_by_id_path = nil)
        if delete_by_id_path.is_a? String
          delete_by_id_path_str = delete_by_id_path
          delete_by_id_path     = ->(m) { delete_by_id_path_str }
        end
        @delete_by_id_path = delete_by_id_path if delete_by_id_path
        @delete_by_id_path ||= ->(m) { "#{@base_uri.call(m)}/#{m[:id]}" }
      end

      def restore_by_id_path(restore_by_id_path = nil)
        if restore_by_id_path.is_a? String
          restore_by_id_path_str = restore_by_id_path
          restore_by_id_path     = ->(m) { restore_by_id_path_str }
        end
        @restore_by_id_path = restore_by_id_path if restore_by_id_path
        @restore_by_id_path ||= ->(m) { "#{@base_uri.call(m)}/restore/#{m[:id]}" }
      end
    end

    def self.included base
      base.extend ClassMethods
    end
  end
end
