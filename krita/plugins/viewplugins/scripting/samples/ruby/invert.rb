# This file is part of Krita
#
# Copyright (c) 2005-2006 Cyrille Berger <cberger@cberger.net>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

require "krosskritacore"

doc = Krosskritacore::get("KritaDocument")
script = Krosskritacore::get("KritaScript")
image = doc.getImage()
layer = image.getActivePaintLayer()
width = layer.getWidth()
print width
height = layer.getHeight()
print height
script.setProgressTotalSteps(width * height)
layer.beginPainting("invert")
it = layer.createRectIterator( 0, 0, width, height )
while (it.isDone() == 0)
    p = it.getRGBA()
    p[0] = 255 - p[0]
    p[1] = 255 - p[1]
    p[2] = 255 - p[2]
    it.setRGBA(p)
    script.incProgress()
    it.next()
end

layer.endPainting()
