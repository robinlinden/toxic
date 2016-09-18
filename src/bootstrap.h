/*  bootstrap.h
 *
 *
 *  Copyright (C) 2016 Toxic All Rights Reserved.
 *
 *  This file is part of Toxic.
 *
 *  Toxic is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  Toxic is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Toxic.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

/* Manages connection to the Tox DHT network. */
void do_tox_connection(Tox *m);

/* Load the DHT nodelist to memory from json formatted nodes file obtained attempts https://nodes.tox.chat/json.
 *
 * Return 0 on success.
 * Return -1 if nodelist file cannot be opened.
 * Return -2 if nodelist file cannot be parsed.
 * Return -3 if nodelist file does not contain any valid node entries.
 */
int load_DHT_nodelist(void);