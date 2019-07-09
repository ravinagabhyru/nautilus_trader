#!/usr/bin/env python3
# -------------------------------------------------------------------------------------------------
# <copyright file="models.pxd" company="Nautech Systems Pty Ltd">
#  Copyright (C) 2015-2019 Nautech Systems Pty Ltd. All rights reserved.
#  The use of this source code is governed by the license as found in the LICENSE.md file.
#  http://www.nautechsystems.io
# </copyright>
# -------------------------------------------------------------------------------------------------

# cython: language_level=3, boundscheck=False, wraparound=False, nonecheck=False


cdef class FillModel:
    """
    Provides probabilistic modeling for order fill dynamics including probability
    of fills and slippage by order type.
    """
    cdef readonly float prob_fill_at_limit
    cdef readonly float prob_fill_at_stop
    cdef readonly float prob_slippage

    cpdef bint is_limit_filled(self)
    cpdef bint is_stop_filled(self)
    cpdef bint is_slipped(self)

    cdef bint _did_event_occur(self, float probability)