# This file is part of NIT ( http://www.nitlanguage.org ).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Support services for Gamnit on Android
module gamnit_android

import android

intrude import gamnit
intrude import android::input_events

redef class App
	redef fun feed_events do app.poll_looper 0

	redef fun native_input_key(event) do return accept_event(event)

	redef fun native_input_motion(event)
	do
		var ie = new AndroidMotionEvent(event)
		var handled = accept_event(ie)

		if not handled then accept_event ie.acting_pointer

		return handled
	end
end
