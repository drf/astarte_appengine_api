#
# This file is part of Astarte.
#
# Astarte is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Astarte is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Astarte.  If not, see <http://www.gnu.org/licenses/>.
#
# Copyright (C) 2017 Ispirata Srl
#

defmodule AstarteAppengineApiWeb.InterfaceValuesController do
  use AstarteAppengineApiWeb, :controller
  alias AstarteAppengineApi.Device

  action_fallback AstarteAppengineApiWeb.FallbackController

  def index(conn, %{"realm_name" => realm_name, "device_id" => device_id}) do
    interfaces = Device.list_interfaces!(realm_name, device_id)
    render(conn, "index.json", interfaces: interfaces)
  end

  def show(conn, %{"realm_name" => realm_name, "device_id" => device_id, "id" => interface, "path" => path}) do
    interface_values = Device.get_interface_values!(realm_name, device_id, interface, path)
    render(conn, "show.json", interface_values: interface_values)
  end

  def show(conn, %{"realm_name" => realm_name, "device_id" => device_id, "id" => interface}) do
    interface_values = Device.get_interface_values!(realm_name, device_id, interface)
    render(conn, "show.json", interface_values: interface_values)
  end

  #TODO: implement this
  #def update(conn, %{"id" => id, "interface_values" => interface_values_params}) do
  #  interface_values = Device.get_interface_values!(id)

  #  with {:ok, %InterfaceValues{} = interface_values} <- Device.update_interface_values(interface_values, interface_values_params) do
  #    render(conn, "show.json", interface_values: interface_values)
  #  end
  #end
end
